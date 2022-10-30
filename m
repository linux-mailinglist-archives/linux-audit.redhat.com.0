Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 62415612BFC
	for <lists+linux-audit@lfdr.de>; Sun, 30 Oct 2022 18:36:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667151365;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=G59DPf+2FHQk0RXfnv7j+a4H+vesflHk9kT+UE9/f7M=;
	b=S0d2+T66NXl0qI/dd8WvLbOxIxS3BO7sc/Lsh6wV9dfwGw1Pi1iNfZ/iF6IRtQjuKkaRe7
	Doc2ffkfOAPO9CCPQ7qYU16yi1VW2idPz0yXXJYM1PH0lEPfB8jgt08Zn2l1KDqRL0wJy5
	J+iPADpnnsBKC8vxVc+ZIARXskR1z6M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-zGGfq4EuOSSgR9HUq-z6mA-1; Sun, 30 Oct 2022 13:36:02 -0400
X-MC-Unique: zGGfq4EuOSSgR9HUq-z6mA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35EB1185A792;
	Sun, 30 Oct 2022 17:36:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 52F3C1121314;
	Sun, 30 Oct 2022 17:35:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 01D7619465B6;
	Sun, 30 Oct 2022 17:35:53 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8757A1946589 for <linux-audit@listman.corp.redhat.com>;
 Sun, 30 Oct 2022 16:46:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 595B8111E412; Sun, 30 Oct 2022 16:46:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51D08111E3FF
 for <linux-audit@redhat.com>; Sun, 30 Oct 2022 16:46:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A5501C05149
 for <linux-audit@redhat.com>; Sun, 30 Oct 2022 16:46:26 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-155-hLyvgYaRMnm3pWei4HlTmw-1; Sun, 30 Oct 2022 12:46:24 -0400
X-MC-Unique: hLyvgYaRMnm3pWei4HlTmw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DF839B80EF6;
 Sun, 30 Oct 2022 16:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74DF4C433C1;
 Sun, 30 Oct 2022 16:37:25 +0000 (UTC)
Date: Sun, 30 Oct 2022 09:37:25 -0700
From: Kees Cook <kees@kernel.org>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 John Johansen <john.johansen@canonical.com>,
 Casey Schaufler <casey@schaufler-ca.com>, Paul Moore <paul@paul-moore.com>
Subject: Re: LSM stacking in next for 6.1?
User-Agent: K-9 Mail for Android
In-Reply-To: <2c48a481-391f-85c7-be4f-13bbc1553aac@I-love.SAKURA.ne.jp>
References: <791e13b5-bebd-12fc-53de-e9a86df23836.ref@schaufler-ca.com>
 <e9ce6253-c8a3-19c3-1b71-f3a2e04539bc@I-love.SAKURA.ne.jp>
 <cc14bbde-529e-376c-7d27-8512ec677db3@schaufler-ca.com>
 <ff43e254-0f41-3f4f-f04d-63b76bed2ccf@I-love.SAKURA.ne.jp>
 <1a9f9182-9188-2f64-4a17-ead2fed70348@schaufler-ca.com>
 <2225aec6-f0f3-d38e-ee3c-6139a7c25a37@I-love.SAKURA.ne.jp>
 <5995f18c-5623-9d97-0aa6-5f13a2a8e895@I-love.SAKURA.ne.jp>
 <77ec837a-ff64-e6f0-fe14-a54c1646ea0b@canonical.com>
 <0fcc5444-a957-f107-25a1-3540588eab5a@I-love.SAKURA.ne.jp>
 <11564f69-3bba-abf7-eb46-06813ff4a404@schaufler-ca.com>
 <98ab33d6-6c91-9c0a-8647-22f6bdede885@I-love.SAKURA.ne.jp>
 <aa201ed7-9ca1-9507-08cc-156f280ee5f4@schaufler-ca.com>
 <3266c2c2-cd7e-bc0f-0fc4-478a63d6ee77@I-love.SAKURA.ne.jp>
 <f7548061-e82d-9a39-ed15-0d32551b4099@canonical.com>
 <53b07579-82f5-404e-5c2c-de7314fff327@I-love.SAKURA.ne.jp>
 <aa5424f3-05a6-530b-bf5f-19e5421f8f3f@canonical.com>
 <2c48a481-391f-85c7-be4f-13bbc1553aac@I-love.SAKURA.ne.jp>
Message-ID: <AB202AC7-9C8D-4109-B4EA-87A7BC1BADF8@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Sun, 30 Oct 2022 17:35:52 +0000
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
Cc: keescook@chromium.org, SElinux list <selinux@vger.kernel.org>,
 James Morris <jmorris@namei.org>, Mimi Zohar <zohar@linux.ibm.com>,
 LSM List <linux-security-module@vger.kernel.org>, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On October 30, 2022 7:02:52 AM PDT, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp> wrote:
>Casey's patchset is trying to provide LSM ID Repository for userspace programs.
>But an LSM ID value cannot be assigned to that LSM unless that module is
>available in the upstream kernel. This means that, developers are not allowed
>to develop a new LSM module even with the intention to become available in the
>upstream kernel, for there always is a risk of LSM ID collision which the LSM ID
>Repository should have avoided from the beginning. Also, this means that, unlike
>PCI devices, users are not allowed to use out-of-tree LSM modules which have to
>remain out-of-tree due to proposed-but-not-accepted by the upstream kernel.
>This is a serious bug; is LSM a proprietary/closed code where modification is
>impossible due to an End-User License Agreement?

You are way off in the weeds with false equivalencies.

>You have only three choices:
>
>  (1) allow assigning LSM ID integer value to all LSM modules (regardless of
>      whether that module was merged into upstream kernel)

We are not hardware manufacturers.

>  (2) use module name string value as LSM ID

This results is greater code complexity. If you see a way to do this, send a patch. Instead of unhelpfully saying "no, do it differently", show a solution.

>  (3) dynamically assign LSM ID integer value when an LSM module is registered

Again, send a patch.

>There never is fourth choice:
>
>  (4) assigning LSM ID integer value to only LSM modules which were merged
>      into upstream kernel
>
>The fourth choice is complete lockout of out of tree projects.

This is just not a real outcome. How is this any different from syscalls, capability bits, prctl values, ELF flags, etc?


-- 
Kees Cook

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

