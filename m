Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C35A7A5899
	for <lists+linux-audit@lfdr.de>; Tue, 19 Sep 2023 06:51:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695099095;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uCVqg70xrsceiDXY0UwsO4fN4nvLVi0F5/u/U50OdAc=;
	b=hAnml0S8nMGhYGpJ7BYXyTTDXnhqypN9Z6iwCT2KZkgRVYSMyN7+mY+OsUr3DwGwUhdLM3
	5fb9Dp7nrd9XHv9cs+v186RKNewGwriart/mapWcC4x/RWGwzNTGQ0nzle4M8hXnObYIeb
	FQ4qc9V984sBlRwFf62I9lyIrm356Kg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-In-7zrWjOPWLErTz11q-xA-1; Tue, 19 Sep 2023 00:51:31 -0400
X-MC-Unique: In-7zrWjOPWLErTz11q-xA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E3153C0F665;
	Tue, 19 Sep 2023 04:51:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DCCE4140E953;
	Tue, 19 Sep 2023 04:51:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4E17A19465B2;
	Tue, 19 Sep 2023 04:51:28 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DC50C1946588 for <linux-audit@listman.corp.redhat.com>;
 Fri, 15 Sep 2023 05:40:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C110540C2009; Fri, 15 Sep 2023 05:40:16 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA43040C2070
 for <linux-audit@redhat.com>; Fri, 15 Sep 2023 05:40:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B40788904B
 for <linux-audit@redhat.com>; Fri, 15 Sep 2023 05:40:16 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-689-3alOJ05INzG7txC3lWub3g-1; Fri,
 15 Sep 2023 01:40:14 -0400
X-MC-Unique: 3alOJ05INzG7txC3lWub3g-1
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 328733F665
 for <linux-audit@redhat.com>; Fri, 15 Sep 2023 05:33:54 +0000 (UTC)
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-52a38baa269so1217125a12.2
 for <linux-audit@redhat.com>; Thu, 14 Sep 2023 22:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694756033; x=1695360833;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E1sgqBA5RHQ4c2dHH9+uKrN3WCzTJqZGhQQSVYVjVZ8=;
 b=S2Bzk6d+PVJSuRkNFUng/abm4CXCvn9OP2SZAZSzgwf1O3xD9k/Qcf6yMJlS/s4Sme
 scxkvqtPQ7hvqVgLTEWbVAneBj8CRNGyjNpmPeWa2aaW4fT1iiRMoKKxoEbFcLeTiK8p
 fjqBylRyAT0R6fQsMStLiFKv/ietnIZOaW4YjnPzz3nZdMwS6OnzXTPQVrKeRCJQZA1n
 /QG4TlclN8I15+ZzV0uJXlYh30SWmmK2QE1nuUc/JPaaMRnLi5BHXRlitT8umw4MZSB7
 vfzf9E8h7RymKacSxmn3QGmmeyYyuAp0C/0m28ohv3ICwM5P4CcIH7uNoF66SzFtgUTS
 6Jxw==
X-Gm-Message-State: AOJu0YxNG8ZBI6Fe+yk3hxXl+eyuzfrCEsJY/q513z58K5lmBx1DJaUT
 /ruq6Tq0mQuz6TlyzRhhH9F3Kx7QfMRGrOSmVdNVyicTokWDx6WhNnqX6mfQHrv7OXzX+dvgyNq
 O+Fgf7HFKkCcoPHbKD2hQuDOgQmzLEQlf9wyMr7O3TgfQrLzdIOzH7JV5LGOf
X-Received: by 2002:a05:6402:14c4:b0:530:4fc4:50f8 with SMTP id
 f4-20020a05640214c400b005304fc450f8mr382659edx.29.1694756033509; 
 Thu, 14 Sep 2023 22:33:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2cgwu/wnUJwcNcmHdPZDUFe8yunJec3eZbQbFszJXosoQ8fPWS2BgX/aIa6f92/4sW9npGgekYNivA2RVgCE=
X-Received: by 2002:a05:6402:14c4:b0:530:4fc4:50f8 with SMTP id
 f4-20020a05640214c400b005304fc450f8mr382648edx.29.1694756033078; Thu, 14 Sep
 2023 22:33:53 -0700 (PDT)
MIME-Version: 1.0
From: Seyeong Kim <seyeong.kim@canonical.com>
Date: Fri, 15 Sep 2023 14:33:42 +0900
Message-ID: <CADrBPndcnp8F5ctMZjg_JBs2xzpMgVJhx8VgjSbb77Z-Uuy-aA@mail.gmail.com>
Subject: Increasing audit netlink buffer size
To: linux-audit@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Tue, 19 Sep 2023 04:51:26 +0000
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
X-Mimecast-Originator: canonical.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello all

Recently I've seen some people who faced below error msg while booting
or while the machine is working.

Error receiving audit netlink packet (No buffer space available)
Error setting audit daemon pid (No buffer space available)
Unable to set audit pid, exiting

increasing q_depth=75000 and -b 8192 didn't help for them.

There is no stable reproducer but I suspect this is because the
default netlink buffer is not big enough. Below were my test steps to
see the above msg.

1. launch instance
2. enable audit with kernel parameters
3. run for i in {1..100000}; do auditctl --reset-lost; done
4. while running #3, keep restarting systemctl restart auditd

I wasn't able to let them test this test pkg but could you please give
me any advice related to this if it makes sense or not?

Thanks in advance. Regards

Index: audit-3.0.7/lib/netlink.c
===================================================================
--- audit-3.0.7.orig/lib/netlink.c
+++ audit-3.0.7/lib/netlink.c
@@ -34,6 +34,9 @@
 #ifndef NETLINK_AUDIT
 #define NETLINK_AUDIT 9
 #endif
+#ifndef SO_RCVBUFFORCE
+#define SO_RCVBUFFORCE 33
+#endif

 static int adjust_reply(struct audit_reply *rep, int len);
 static int check_ack(int fd);
@@ -47,6 +50,7 @@ static int check_ack(int fd);
 int audit_open(void)
 {
        int saved_errno;
+       int rcvbuf;
        int fd = socket(PF_NETLINK, SOCK_RAW, NETLINK_AUDIT);

        if (fd < 0) {
@@ -62,6 +66,19 @@ int audit_open(void)
                errno = saved_errno;
                return fd;
        }
+
+       rcvbuf = 10*1024*1024;  // size is temp value for now.
+       if (setsockopt(fd, SOL_SOCKET, SO_RCVBUFFORCE,
+                      &rcvbuf, sizeof(rcvbuf))) {
+               saved_errno = errno;
+               audit_msg(LOG_ERR,
+                       "Error setting netlink sock buffer size (%s)",
+                       strerror(errno));
+               close(fd);
+               errno = saved_errno;
+               return -1;
+       }
+
        if (fcntl(fd, F_SETFD, FD_CLOEXEC) == -1) {
                saved_errno = errno;
                audit_msg(LOG_ERR,

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

