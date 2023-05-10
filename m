Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FA46FDF30
	for <lists+linux-audit@lfdr.de>; Wed, 10 May 2023 15:52:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683726722;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UP2fqPSSIeFdWsUmu9KwyYR283zXLAluEanlXWiuJT8=;
	b=JCepU1yYr6j9HCUSezYRGlYoCXXK98hFBljFEAN6CNn6QgQVMxVnz7CSQkZjEdzvwlaWtX
	EMMkzq8xZYwxEqb36qBYOTlT1P80alOAjxhzJBKKYe+7v5qXBz/o6wBHbEsnLD1pvDQYDW
	WWFl520XnLiP69O7Bj5hN8jNWZGjnPU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-OEnRjSLmNMO4TkzMFI37aA-1; Wed, 10 May 2023 09:51:59 -0400
X-MC-Unique: OEnRjSLmNMO4TkzMFI37aA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6A3A3C1069B;
	Wed, 10 May 2023 13:51:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 795841410F23;
	Wed, 10 May 2023 13:51:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 165EB19451C3;
	Wed, 10 May 2023 13:51:56 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0C16F1946A45 for <linux-audit@listman.corp.redhat.com>;
 Wed, 10 May 2023 13:51:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E176A18EC1; Wed, 10 May 2023 13:51:54 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.17.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E59647CD0;
 Wed, 10 May 2023 13:51:54 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: sending audit logs only to audit.log via rsyslog
Date: Wed, 10 May 2023 09:51:53 -0400
Message-ID: <4838148.31r3eYUQgx@x2>
Organization: Red Hat
In-Reply-To: <CAN-5jM-V+J5aZTnu86NzgKw3LGSZ76LyTusrF-MF+V_LjV3u7A@mail.gmail.com>
References: <CAN-5jM-V+J5aZTnu86NzgKw3LGSZ76LyTusrF-MF+V_LjV3u7A@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wednesday, May 10, 2023 9:43:04 AM EDT kathy lyons wrote:
>  Good morning.  I am trying to get the audit logs to be written only to
> audit.log.  Currently they are written to audit.log as well as syslog.
> Here is my rsyslog.conf file - what am I doing wrong?
> 
>     module(load="imfile")
>     module(load="imklog")
>     module(load="imjournal")
> 
>     global(net.enableDNS="off" workDirectory=/var/spool/rsyslog"
> maxMessageSize="128k")
> 
>    $IncludeConfig /etc/rsyslog.d/*.conf
>    $ActionFileDefaultTemplate RSYSLOG_TraditionalFileFormat
> 
>   ##################### rules
>     audit.*                                 ~/var/log/audit/audit.log
>     auth.warning;authpriv.info   ~/var/log/auth.log
>     *.*;auth,authpriv.none           ~/var/log/syslog
>     cron.info                               ~/var/log/cron.log
>     daemon.info                        ~/var/log/daemon.log
>     kern.*                                  ~/var/log/kern.log
>     user.info                             ~/var/log/user.log

The thing that is writing them to rsyslog is systemd-journald. You can stop 
this by running:

systemctl mask systemd-journald-audit.socket
systemctl stop systemd-journald-audit.socket

Then you will only have logs written to the audit log.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

