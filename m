Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DA965157D
	for <lists+linux-audit@lfdr.de>; Mon, 19 Dec 2022 23:21:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671488484;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/HLxZa7hGQUl7wkZMqfw7g1ghyaSoZSuuKzFV0lyih4=;
	b=ZxHEqNoatt8R61yHqUSfRt9/P8HRk2StFyVxoGuKh7MXEXfe6lINha9lz5z3um4zpsmKU1
	RXa0c0oo6aFsIXiXlPDRdy+w1VeDpDb25ccVnpjCy68G/3UC9StsGCb5ye6Zwvekez77Mg
	BTKuSTniykWOBlGJBXmEj3R8q9odUNU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-GDR4E8CSOSWwhrBonUGjNA-1; Mon, 19 Dec 2022 17:21:22 -0500
X-MC-Unique: GDR4E8CSOSWwhrBonUGjNA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 736A129ABA1A;
	Mon, 19 Dec 2022 22:21:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6895140C1073;
	Mon, 19 Dec 2022 22:21:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 553A719465A2;
	Mon, 19 Dec 2022 22:21:08 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D15A7194658D for <linux-audit@listman.corp.redhat.com>;
 Mon, 19 Dec 2022 22:21:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8535E40ED76E; Mon, 19 Dec 2022 22:21:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CB6D4014EBE
 for <linux-audit@redhat.com>; Mon, 19 Dec 2022 22:21:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F79729A9D39
 for <linux-audit@redhat.com>; Mon, 19 Dec 2022 22:21:06 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-227-lze5zZq6OFmKW8aqMoZfoA-1; Mon, 19 Dec 2022 17:21:03 -0500
X-MC-Unique: lze5zZq6OFmKW8aqMoZfoA-1
Received: by mail-pl1-f176.google.com with SMTP id 4so10436789plj.3
 for <linux-audit@redhat.com>; Mon, 19 Dec 2022 14:21:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PgfTMIP5lJrBv3uwYpqC8mJxqxNyHoGIRLp/gDo0WU0=;
 b=6ApILKAT72FZTbuXRY1A89NVLuoFYoRefx/AgviMasUzzH9WjGZfk9+B0V+mFEYKOw
 rjVDsQcDy14k9xrCVTZl+jU2LWwUAHCRr8R15EAS0AZpPqWTSRGj4Xe04cUh7Ls0+Szs
 zSlycRH6O/ng/GmJyv3U7Xa7HmlwHQsOepYL4t6/LdLDLimrnYXqbaFFUJ0zVS0NEhoi
 qgxpvnLbIbuIKEvo7MGuJ+SGxfFZZZM28KhkxDmLLG8SYwAjd4ulMrXIVf5P72yK/y7/
 1NkmVbwFAXeKAMFN+Q6Z7IUvyRB7dJa8NyuJFmmwGMVIg1J0qloJdMUNSb3uaY2ZgL4U
 Ey9Q==
X-Gm-Message-State: AFqh2kqdq+w5YUBvE0HAuHa4vprkse41T3iM52c91hJEZq20J6XczX17
 AbEqam5azK8Ks5GDuM5bATu6ZfZqwg4HCYzNz2xw
X-Google-Smtp-Source: AMrXdXuEbWAHBH5J2T2oCdnAeEyhUOTHbHmqRHseEqFjoJXuFtoq4ZuY4UotxFDOJ7XuNmmvuIGsVxQWG1CN3IUjvi8=
X-Received: by 2002:a17:90a:6481:b0:221:5597:5de7 with SMTP id
 h1-20020a17090a648100b0022155975de7mr1622449pjj.147.1671488461633; Mon, 19
 Dec 2022 14:21:01 -0800 (PST)
MIME-Version: 1.0
References: <20221219180024.1659268-1-omosnace@redhat.com>
 <20221219180024.1659268-3-omosnace@redhat.com>
In-Reply-To: <20221219180024.1659268-3-omosnace@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 19 Dec 2022 17:20:50 -0500
Message-ID: <CAHC9VhQCrFqM33s+W+VXANfY-De-YqH206HjB7E7a8nPvjzDow@mail.gmail.com>
Subject: Re: [PATCH RESEND 2/2] selinux: provide matching audit timestamp in
 the AVC trace event
To: Ondrej Mosnacek <omosnace@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Cc: =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>,
 selinux@vger.kernel.org, Peter Enderborg <peter.enderborg@sony.com>,
 linux-security-module@vger.kernel.org, linux-audit@redhat.com,
 Zdenek Pytela <zpytela@redhat.com>, Michal Sekletar <msekleta@redhat.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 19, 2022 at 1:00 PM Ondrej Mosnacek <omosnace@redhat.com> wrote:
>
> In order to make it possible for the users and tooling to associate an
> SELinux AVC trace event with the corresponding audit event, make it
> include the audit timestamp (including the "serial number") of the
> event.
>
> First make audit_log_start() include the timestamp in the audit_buffer
> struct and add a public helper to retrieve it from an audit_buffer
> instance. Then retrieve it in SELinux's avc_audit_post_callback() and
> include it in the "avc:selinux_audited" trace event.
>
> After this patch the even includes the numeric fields that make up the
> timestamp and the text representation includes the timestamp in the same
> format as used in the audit log - e.g. "audit_ts=1671454430.092:1671".
>
> Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
> ---
>  include/linux/audit.h      |  8 ++++++++
>  include/trace/events/avc.h | 25 +++++++++++++++++--------
>  kernel/audit.c             | 15 +++++++++++----
>  security/selinux/avc.c     |  4 +++-
>  4 files changed, 39 insertions(+), 13 deletions(-)

I'm not really liking the idea of exposing the audit timestamp for use
in other subsystems, even if it is just for use in a trace event.  I
generally take the approach that audit's charter is to capture and log
security relevant events to userspace where admins and security
officers can use the events to help meet their security goals.  While
audit may have some value to developers as a debugging tool, that is
not its primary purpose, and at this point in time I'm not supportive
of adding additional burdens to the audit subsystem to support a
debugging use case (I view exporting and maintaining a proper
timestamp value/struct an additional requirement on the audit
subsystem).

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

