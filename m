Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 09A6D2C0FB6
	for <lists+linux-audit@lfdr.de>; Mon, 23 Nov 2020 17:06:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606147561;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UKvu6mKQ9/HI8fIJY6sdaPLKebfNnVQeNJoNW0Fd1ZU=;
	b=URPi4XvrP/j8FzDMdHVDoLkyPrWf7kZ6aNxyY4NNo8A1g5liLUrsCAePFuWG5QAvA5WBGb
	P6ZYiYL4CF8A3DKCSe+vdA5l/I/92bM/s/lwPl0PkLlJ3CiUUjWXpTnTTEP2NSaEcN11LP
	4HZ/3d8M2aLaZNZFKJXVMVkhwsrRtwk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-IG7BXJQePFWQTd6kZlCVyQ-1; Mon, 23 Nov 2020 11:05:57 -0500
X-MC-Unique: IG7BXJQePFWQTd6kZlCVyQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21A2C8144F4;
	Mon, 23 Nov 2020 16:05:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8AC160C04;
	Mon, 23 Nov 2020 16:05:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D25345002C;
	Mon, 23 Nov 2020 16:05:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ANG5jTV016887 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 23 Nov 2020 11:05:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 87AC413470; Mon, 23 Nov 2020 16:05:45 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-234.rdu2.redhat.com [10.10.117.234])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 39899620DE;
	Mon, 23 Nov 2020 16:05:42 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Linux-audit@redhat.com, Andreas Hasenack <andreas@canonical.com>
Subject: Re: Clarification on log rotation
Date: Mon, 23 Nov 2020 11:05:41 -0500
Message-ID: <2063648.irdbgypaU6@x2>
Organization: Red Hat
In-Reply-To: <CANYNYEE1kBF1mDFUGhd7uJUHX8Bth9Qmhk0WKE4V+nNaYCnz0w@mail.gmail.com>
References: <CANYNYEE1kBF1mDFUGhd7uJUHX8Bth9Qmhk0WKE4V+nNaYCnz0w@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Monday, November 23, 2020 9:21:56 AM EST Andreas Hasenack wrote:
> I'm checking auditd's native logrotation mechanism.
> 
> The auditd.conf manpage states this for num_logs:
> 
> "The excess log check  is  only  done  on startup and when a
> reconfigure results in a space check."
> 
> I kept generating events, and truth be told, no rotation happened once
> the logfile size was above max_log_file. At least not after a few
> minutes.

Rotation is different than excess log checks. Log size checking is done every 
write. But this is only done when the daemon is not in debug mode and  
write_logs is not 0 and max_log_size_action is rotate and num_logs > 1.

> When does a space check happens, besides on a restart? Just external
> events likg SIGUSR1 and perhaps SIGHUP?

Every 3 writes.

> Since these are external events, how do sysadmins deal with log
> rotation: completely ignore auditd's native mechanism and setup
> logrotate as usual?

Generally people fall into 3 camps. The first camp is they correctly configure 
the native implementation and just use it. The second camp need something 
special. They either set max_log_size_action to keeplogs and then handle it 
on a cron job where that may use checkpointing. And yet another group just 
sends events to syslog and handle it via splunk or elastic search.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

