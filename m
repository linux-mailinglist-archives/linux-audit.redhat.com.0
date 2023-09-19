Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA417A6F74
	for <lists+linux-audit@lfdr.de>; Wed, 20 Sep 2023 01:35:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695166507;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=m/mST35yvc+KOK/PLFxUtmcfm1JOw3KIKzddB4DyilE=;
	b=DT+6z6TCLKBsVqRSTwgsdOUGLocTLwNJ/TjGN1Ny0D6aNLkdBbppWoZnFWKZruzHc4xb2T
	PgzReLgF5vn2H+h4s1hqWNdOhi+rXJTxsZwvXPx00ccIC8n2QMv/U+kuGfPC1Yhs68/+3S
	aZ2IMhsnHd39oSKNnQThFTtFeI0tAlw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-690-e7N3wUDmPCWdEsf4RPbrFA-1; Tue, 19 Sep 2023 19:35:03 -0400
X-MC-Unique: e7N3wUDmPCWdEsf4RPbrFA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A47191C06350;
	Tue, 19 Sep 2023 23:35:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5E94040C6EBF;
	Tue, 19 Sep 2023 23:34:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C50E019465B9;
	Tue, 19 Sep 2023 23:34:50 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5A404194658D for <linux-audit@listman.corp.redhat.com>;
 Tue, 19 Sep 2023 23:33:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 39C1A2156A27; Tue, 19 Sep 2023 23:33:28 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.17.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 133FD2156701;
 Tue, 19 Sep 2023 23:33:27 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: Increasing audit netlink buffer size
Date: Tue, 19 Sep 2023 18:40:08 -0400
Message-ID: <1887121.tdWV9SEqCh@x2>
Organization: Red Hat
In-Reply-To: <CADrBPndcnp8F5ctMZjg_JBs2xzpMgVJhx8VgjSbb77Z-Uuy-aA@mail.gmail.com>
References: <CADrBPndcnp8F5ctMZjg_JBs2xzpMgVJhx8VgjSbb77Z-Uuy-aA@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

Thanks for reporting the issue.

On Friday, September 15, 2023 1:33:42 AM EDT Seyeong Kim wrote:
> Recently I've seen some people who faced below error msg while booting
> or while the machine is working.
> 
> Error receiving audit netlink packet (No buffer space available)
> Error setting audit daemon pid (No buffer space available)
> Unable to set audit pid, exiting
> 
> increasing q_depth=75000 and -b 8192 didn't help for them.
> 
> There is no stable reproducer but I suspect this is because the
> default netlink buffer is not big enough.

The default netlink buffer is set by this sysctl:

# sysctl net.core.rmem_default
net.core.rmem_default = 212992

200k should be plenty to hold a 9k netlink packet at the most.

> Below were my test steps to
> see the above msg.
> 
> 1. launch instance
> 2. enable audit with kernel parameters
> 3. run for i in {1..100000}; do auditctl --reset-lost; done
> 4. while running #3, keep restarting systemctl restart auditd

Hmm. restarting auditd via systemctl can be problematic. It has to wait for 
auditd to terminate or you can have 2 active at once. This is one of the 
reasons why we disallow the direct use of systemctl to 

> I wasn't able to let them test this test pkg but could you please give
> me any advice related to this if it makes sense or not?

This is the only report of this I've heard of. Which kernel? Has the sysctl 
been modified from the default? What are the audit parameters given at the 
boot prompt? Which version of the audit package?

I don't think the code in this area has changed for a long time. Also, 
recvfrom man page does not mention ENOBUFS. The netlink(7) man page seems to 
indicate something about acks possibly causing this. However, loading rules 
is done one at at time. I don't really understand how it gets backed up like 
this unless 2 auditd are stepping on each other somehow.

-Steve

> Thanks in advance. Regards
> 
> Index: audit-3.0.7/lib/netlink.c
> ===================================================================
> --- audit-3.0.7.orig/lib/netlink.c
> +++ audit-3.0.7/lib/netlink.c
> @@ -34,6 +34,9 @@
>  #ifndef NETLINK_AUDIT
>  #define NETLINK_AUDIT 9
>  #endif
> +#ifndef SO_RCVBUFFORCE
> +#define SO_RCVBUFFORCE 33
> +#endif
> 
>  static int adjust_reply(struct audit_reply *rep, int len);
>  static int check_ack(int fd);
> @@ -47,6 +50,7 @@ static int check_ack(int fd);
>  int audit_open(void)
>  {
>         int saved_errno;
> +       int rcvbuf;
>         int fd = socket(PF_NETLINK, SOCK_RAW, NETLINK_AUDIT);
> 
>         if (fd < 0) {
> @@ -62,6 +66,19 @@ int audit_open(void)
>                 errno = saved_errno;
>                 return fd;
>         }
> +
> +       rcvbuf = 10*1024*1024;  // size is temp value for now.
> +       if (setsockopt(fd, SOL_SOCKET, SO_RCVBUFFORCE,
> +                      &rcvbuf, sizeof(rcvbuf))) {
> +               saved_errno = errno;
> +               audit_msg(LOG_ERR,
> +                       "Error setting netlink sock buffer size (%s)",
> +                       strerror(errno));
> +               close(fd);
> +               errno = saved_errno;
> +               return -1;
> +       }
> +
>         if (fcntl(fd, F_SETFD, FD_CLOEXEC) == -1) {
>                 saved_errno = errno;
>                 audit_msg(LOG_ERR,
> 
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-audit




--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

