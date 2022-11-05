Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E8761A77F
	for <lists+linux-audit@lfdr.de>; Sat,  5 Nov 2022 05:26:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667622399;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jCvev90hZnER3L7R5sHHi2pW550gTUn5R5cHljzFLTg=;
	b=IuzzSHbHFWnkbh95s1KUHi2jxkbaZFgEYaQ1dWpDvV1e1jS9eA/0KtCyEhl0NfupJmmQQt
	e9lQd/Ur70iaYTGK18Rel+PYGydBkyGjPrGacjEfNpGxyDPj/eJ4dXFRs7i6TxNjiRi4cz
	hmLGM5eoI9aKLwgdp4sMTPk03fU8Ny4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-xGrkJnYpMdq1r7mPcwKk8w-1; Sat, 05 Nov 2022 00:26:36 -0400
X-MC-Unique: xGrkJnYpMdq1r7mPcwKk8w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DBA5E2999B3F;
	Sat,  5 Nov 2022 04:26:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C6E5A1121339;
	Sat,  5 Nov 2022 04:25:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6EB8D19465A4;
	Sat,  5 Nov 2022 04:25:57 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A9B951946586 for <linux-audit@listman.corp.redhat.com>;
 Sat,  5 Nov 2022 04:25:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8BA3C40C83AD; Sat,  5 Nov 2022 04:25:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83F2E40C83EC
 for <linux-audit@redhat.com>; Sat,  5 Nov 2022 04:25:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68B1F185A78B
 for <linux-audit@redhat.com>; Sat,  5 Nov 2022 04:25:55 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-246-9gT4fqydOuWGjFxi8RuUYQ-1; Sat, 05 Nov 2022 00:25:53 -0400
X-MC-Unique: 9gT4fqydOuWGjFxi8RuUYQ-1
Received: by mail-ot1-f46.google.com with SMTP id
 cb2-20020a056830618200b00661b6e5dcd8so3720778otb.8
 for <linux-audit@redhat.com>; Fri, 04 Nov 2022 21:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mWcQZ8UCOxaihPPAgTuBEMYgtN854Rn/VlFuJeIIiQY=;
 b=yvn52Hac0dO1sdvd8CGSM8IMosbaqYRn3zLkuem/kxBii+1ZyMwMwizrIr8c139v25
 ajpfEZz4s1HOEqW+RTgcALyLljcMy5kTb3loDcDVFsSPs+jyiUeXAMN/iVLdsKXF6XPk
 V6k/uXXh7I9odRQ4Qy2psbAVe4C+gtWc/xbbIzTR3qCEJwVYouNv0yigJ+NaCp3hkT2m
 g1nVrjIuY7rDPOocAilUedKw7OIQbkCV+tEppILC56g6xMhJildzt+oCspZO2pUQRh2N
 uMIvcIiFUm5vsODdST9vSiaskzUwNzs8ouxO0bEXB1Tq62nwtWW8Q2TjLUmQy0llrFoW
 RPDg==
X-Gm-Message-State: ACrzQf3uksxVuZ5K9dQFEr8vxj2ipvl2rOSdV4pVYvBbPlGzoipo5pYq
 19SHWxRP4MfRzbhaGmAwKC8mQ+EwYNYgAukjONgN
X-Google-Smtp-Source: AMsMyM6U+PHfzNvZ4D2DNw/ptrIacD4VTyjjcxuLQdNkzL/Wtpl7qVnNHP5GiTZ9poRVIb+o4CPBujRfjahI0G+ZOx8=
X-Received: by 2002:a9d:7f84:0:b0:66c:53ef:e555 with SMTP id
 t4-20020a9d7f84000000b0066c53efe555mr14337142otp.34.1667622352590; Fri, 04
 Nov 2022 21:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20221031021021.3888564-1-cuigaosheng1@huawei.com>
 <CAHC9VhQ2q0rA_OtL9VZm=dMLwMKu2cME3bC2LEzTBa3A-XsQbg@mail.gmail.com>
 <5e5ce295-5ef1-0248-8265-886d2d0067f7@huawei.com>
In-Reply-To: <5e5ce295-5ef1-0248-8265-886d2d0067f7@huawei.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 5 Nov 2022 00:25:41 -0400
Message-ID: <CAHC9VhRcuHHRMshLekU0aP=pwvxKpbxKwgjxoh8kZUKPAB-TPg@mail.gmail.com>
Subject: Re: [PATCH] audit: fix undefined behavior in bit shift for AUDIT_BIT
To: cuigaosheng <cuigaosheng1@huawei.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Cc: arnd@arndb.de, paulmck@kernel.org, eparis@redhat.com, dhowells@redhat.com,
 linux-audit@redhat.com, mtk.manpages@gmail.com, tglx@linutronix.de
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 31, 2022 at 7:50 AM cuigaosheng <cuigaosheng1@huawei.com> wrote:
> > Thanks, this patch looks good, although the 'Fixes:' line above isn't
> > correct.  The commit you reference may be the commit which created
> > AUDIT_BIT in include/uapi/linux/audit.h, but before that it was
> > defined in include/linux/audit.h with the original implementation
> > shipping in v2.6.6-rc1.  As the original AUDIT_BIT implementation
> > predates git itself, I would suggest removing the 'Fixes' line
> > entirely and I'll simply add the usual stable marking when I merge it
> > into audit/stable-6.1.  If that is okay with you I'll go ahead and
> > merge this patch which that tweak - is that okay?
>
> Yes, you are right, thanks for taking time to review this patch!

You're welcome, thanks for the fix :)

I just merged this into audit/stable-6.1 and I'll send this up to
Linus next week.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

