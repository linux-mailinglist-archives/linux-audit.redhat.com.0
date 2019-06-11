Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5AD3CC01
	for <lists+linux-audit@lfdr.de>; Tue, 11 Jun 2019 14:46:00 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 54692307D9D1;
	Tue, 11 Jun 2019 12:45:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3C225C22E;
	Tue, 11 Jun 2019 12:45:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A6C4E149E4;
	Tue, 11 Jun 2019 12:45:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5BCiZqI010352 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 11 Jun 2019 08:44:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 56414611BC; Tue, 11 Jun 2019 12:44:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-122-32.rdu2.redhat.com [10.10.122.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 10EAD611BA;
	Tue, 11 Jun 2019 12:44:32 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: RHEL7 audispd syslog journal question
Date: Tue, 11 Jun 2019 08:44:30 -0400
Message-ID: <4611954.16RxT8IaCd@x2>
Organization: Red Hat
In-Reply-To: <07fef14388544a36828818d3e0691f3c@XCGVAG30.northgrum.com>
References: <07fef14388544a36828818d3e0691f3c@XCGVAG30.northgrum.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Tue, 11 Jun 2019 12:45:59 +0000 (UTC)

On Tuesday, June 11, 2019 8:14:30 AM EDT Boyce, Kevin P [US] (AS) wrote:
> Does anyone have any ideas how to prevent the journal from filling up with
> events that come from audispd?

On RHEL 7, there is no systemd-journald-audit.socket. So, if you are wrapping 
events to syslog, then that is how it gets filled. In general, systems that 
hae the systemd-journald-audit.socket can just mask it to prevent that path.

systemctl mask systemd-journald-audit.socket

> There is a double penalty due to this and it really slows down my system
> with a lot of rules in place.

Might also want to limit log size:

sed -i "/^#SystemMaxUse/s/#SystemMaxUse=/SystemMaxUse=200/" /etc/systemd/
journald.conf

 
> I have audispd syslog plugin enabled to send remotely as LOG_LOCAL5.
> Auditd is also writing output to /var/log/audit/audit.log.

If you wanted to restore your system to something that resembles normal 
systems, then you can do something along these lines:

## Disable journald
systemctl mask systemd-journald.service
systemctl mask systemd-journald-dev-log.socket
systemctl mask systemd-journald.socket
systemctl mask systemd-journal-flush.service
systemctl mask systemd-journal-catalog-update.service
systemctl mask syslog.socket
## Enable rsyslog to handle logging
sed -i "/SysSock.Use/s/off/on/" /etc/rsyslog.conf
sed -i "/imjournal/s/module/#module/" /etc/rsyslog.conf
sed -i "/StateFile/s/^/#/" /etc/rsyslog.conf
sed -i "/imklog/s/#module/module/" /etc/rsyslog.conf

I tested this on recent Fedora. So, there may be some differences between F29 
and RHEL 7. But this should be enough that you can experiment to finish it off. 
After this, syslog is actually usable like it used to be.
 
-Steve

> If you do journalctl -u auditd you also see copies of the syslog events. 
> Is there any way to prevent this behavior? I did find this RedHat page but
> it doesn't really sound like a good solution, having to modify selinux
> policy. https://bugzilla.redhat.com/show_bug.cgi?id=1419388
> 
> Thanks,
> Kevin




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
