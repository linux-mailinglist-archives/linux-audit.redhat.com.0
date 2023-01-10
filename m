Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A239664448
	for <lists+linux-audit@lfdr.de>; Tue, 10 Jan 2023 16:16:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673363767;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3lWecrSe4fJ7yjuJSdsXvJ+dfhoGWgyCMAkvHjTwlNk=;
	b=eJQPNXZHgMdXzvOMCM6D+dqLygypRr5XO8KlqhaMjmxip3l0ZcN6oMRMtd+0AJccWeG2F9
	IR2viVCCZ22z4o/6OnixBxuwJwZ/G0NnuZD/0YE6ATU2bK/vTLlJ1GCnxbqAV11F/iA/gw
	gjrnkbU263cNdMfa5ATkmpTTNWa/kRU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-JAiee9dyO6GTgpCCSBO_8A-1; Tue, 10 Jan 2023 10:16:05 -0500
X-MC-Unique: JAiee9dyO6GTgpCCSBO_8A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F06585CCE4;
	Tue, 10 Jan 2023 15:16:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 55CAE140EBF4;
	Tue, 10 Jan 2023 15:16:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A9677194E11C;
	Tue, 10 Jan 2023 15:16:00 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 056EF1946587 for <linux-audit@listman.corp.redhat.com>;
 Tue, 10 Jan 2023 15:15:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D966240C1141; Tue, 10 Jan 2023 15:15:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.9.158])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 99D4F4014CE2;
 Tue, 10 Jan 2023 15:15:58 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Linux-audit@redhat.com, linux-audit@redhat.com
Subject: Re: Identify whether the kernel version supports Path based exclusion
Date: Tue, 10 Jan 2023 10:15:58 -0500
Message-ID: <5902815.lOV4Wx5bFT@x2>
Organization: Red Hat
In-Reply-To: <CAPoNrttQd+ieQ+B93SbrbiPjppRoiyT_a+7FpiRdQNGQ2ApiXQ@mail.gmail.com>
References: <CAPoNrttQd+ieQ+B93SbrbiPjppRoiyT_a+7FpiRdQNGQ2ApiXQ@mail.gmail.com>
MIME-Version: 1.0
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
Cc: avtanshgupta1995@gmail.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

On Tuesday, January 10, 2023 7:08:12 AM EST Anurag Aggarwal wrote:
> I need a method to identify whether the audid version a kernel is running
> supports path based exclusions.

It's not dependant on auditd. The kernel itself decides if a rule is valid.
 
> One option would be to use audit_add_rule_data to add a temporary path
> based rule and check if it is successful, but this won't work when auditd
> is running in immutable mode.
> 
> Any other way which does not require checking versions of Kernel or
> Distribution?

If you are looking to see if this is supported

-a always,exclude  -F exec=/usr/bin/ls

then it can be detected by:

uint32_t features = audit_get_features();
if ((features & AUDIT_FEATURE_BITMAP_EXCLUDE_EXTEND) == 0)
    puts("not supported");
else
    puts("supported");

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

