Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D58E52FB98
	for <lists+linux-audit@lfdr.de>; Thu, 30 May 2019 14:31:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7489130C5846;
	Thu, 30 May 2019 12:31:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FE014FA35;
	Thu, 30 May 2019 12:31:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 35D4C149E1;
	Thu, 30 May 2019 12:31:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4UCV2Ug032074 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 30 May 2019 08:31:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3A83761B94; Thu, 30 May 2019 12:31:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-122-132.rdu2.redhat.com [10.10.122.132])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EF7297943D;
	Thu, 30 May 2019 12:30:55 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: Missing login records - Audit functionality in different kernel
	versions
Date: Thu, 30 May 2019 08:30:52 -0400
Message-ID: <9453511.RplY5aRnKT@x2>
Organization: Red Hat
In-Reply-To: <AxkNEg.6xBamOA67vUU.O6mFWVI0mE32fIXmL36@freemail.hu>
References: <AxkNEg.6xBamOA67vUU.O6mFWVI0mE32fIXmL36@freemail.hu>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x4UCV2Ug032074
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Thu, 30 May 2019 12:31:56 +0000 (UTC)

Hello,

On Thursday, May 30, 2019 3:37:23 AM EDT R=F3bert Nagy wrote:
> I tested Audit on a Debian 7 (kernel version 3.2.0-5-amd64), but in the
> audit.log I get no USER_AUTH, USER_ACCT, CRED_ACQ, USER_START and
> USER_LOGIN record types at all, Only USER_LOGIN types.
> =

> As I understand these records should be there without any rules set.
> https://www.redhat.com/archives/linux-audit/2017-July/msg00046.html

Yes. These are sent by pam. So, the question would be, is your copy of pam =

compiled with audit support?

ldd /usr/lib64/libpam_misc.so | grep libaudit
	libaudit.so.1 =3D> /lib64/libaudit.so.1 (0x00007f06c2c39000)


> On another server with kernel version 4.9 it works properly. Is there a
> possibility that this Audit functionality is not implemented in kernel
> version 3.2, or is this just a configuration issue on my side?

This should be pam.

-Steve
 =

> We have too many Debian 3.x production servers to consider kernel upgrade
> being an option.
> =

> If it's a kernel issue, could you please recommend any workaround?
> Currently I am thinking on parsing the auth.log
> =

> Many thanks,
> Robert
> =

> auditd.conf:
> log_file =3D /var/log/audit/audit.log
> log_format =3D RAW
> log_group =3D root
> priority_boost =3D 4
> flush =3D INCREMENTAL
> freq =3D 20
> num_logs =3D 4
> disp_qos =3D lossy
> dispatcher =3D /sbin/audispd
> name_format =3D NONE
> ##name =3D mydomain
> max_log_file =3D 5
> max_log_file_action =3D ROTATE
> space_left =3D 75
> space_left_action =3D SYSLOG
> action_mail_acct =3D root
> admin_space_left =3D 50
> admin_space_left_action =3D SUSPEND
> disk_full_action =3D SUSPEND
> disk_error_action =3D SUSPEND
> ##tcp_listen_port =3D
> tcp_listen_queue =3D 5
> tcp_max_per_addr =3D 1
> ##tcp_client_ports =3D 1024-65535
> tcp_client_max_idle =3D 0
> enable_krb5 =3D no
> krb5_principal =3D auditd
> ##krb5_key_file =3D /etc/audit/audit.key





--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
