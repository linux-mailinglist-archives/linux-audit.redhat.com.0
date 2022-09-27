Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC215ED058
	for <lists+linux-audit@lfdr.de>; Wed, 28 Sep 2022 00:38:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664318307;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=P2VSt9X4eiGHi0nXd4WdjA8g5xYGQhhDvZ/P93Z1Vzc=;
	b=aJc3L1sMmNEu2NMSg2r3HXat2uvRALyaS1G4GyAuuiAyZykCAZJj0Z2owdVmJ4RaLALeo7
	PRhG0mYknqmykIGvWD1tafSLdahncv+LD18c9qoBDBktCZRUK1M+AAYTL1UtPWW1INCdOy
	QqtM2Qwq+KxQAQlgWr2DBGnBg/A27xw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-pO_WMLvjOxqUzarK3ZF90w-1; Tue, 27 Sep 2022 18:38:24 -0400
X-MC-Unique: pO_WMLvjOxqUzarK3ZF90w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95639801231;
	Tue, 27 Sep 2022 22:38:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 20AF8C15BA4;
	Tue, 27 Sep 2022 22:38:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E18C71946A48;
	Tue, 27 Sep 2022 22:38:11 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 18FCF1946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 27 Sep 2022 22:37:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0955C492CA4; Tue, 27 Sep 2022 22:37:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 02AAB492CA2
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 22:37:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1316185A794
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 22:37:18 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614-Jqb0Eqb4PKW3sKHra17nsg-1; Tue, 27 Sep 2022 18:37:17 -0400
X-MC-Unique: Jqb0Eqb4PKW3sKHra17nsg-1
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-13175b79807so5097782fac.9
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 15:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=HuReV2OQBnHcceVx8SqAsjobLICjCWNggHjGYWWV+mw=;
 b=3YvZcfA63AgiTEXXKQNplqSW/vghBJzCXQwjZHRpmLJJb45wi1Wd+HZiNGK/76pUX9
 0b6f/grvR5uZ9EmOgUo6qGH2ELdkD0a6rLEkQBSaT5UK6SlllyoaH0OySX6mEqb4hmFy
 loQwKcxrmunkDC8RP9h5OvkYOij/aOgU6xkCrM5gJLyDRi58d+40r3coghxuhQHAmvWA
 K2Pyuyre+pXaVWahOxImk16JAD8YW0+mFgqFsDbdFgnitJyB6glhysof0ZT/nFBjQ2zJ
 6/qZhGXar7xb0pmZfHaaAGntn6/WvrY0QAULvT6LDqUFAnHNuOoyY008inmS8bV0yoNm
 qeMQ==
X-Gm-Message-State: ACrzQf3znLH+lDShzSbu9C+phltjhiHqZ50IkvJmvXMwDxGaH+sUsQXi
 zRi3s8Nm5hcivs+V3q79K/11kOYT1ZlaUHxB26Vx
X-Google-Smtp-Source: AMsMyM4O2kGKvQzlomKIOb0sQmWIrDacYCBH/MJwdv3Scfmk2nloSnvq4/fo5b8iVk8ahjRk0FQGApbxKdoxXXfs7G0=
X-Received: by 2002:a05:6870:a916:b0:131:9361:116a with SMTP id
 eq22-20020a056870a91600b001319361116amr1904631oab.172.1664318236263; Tue, 27
 Sep 2022 15:37:16 -0700 (PDT)
MIME-Version: 1.0
References: <791e13b5-bebd-12fc-53de-e9a86df23836.ref@schaufler-ca.com>
 <CAHC9VhSF8hWg=7tbFiCrizNF61vpwJcU3793LcStiu-anW4i1g@mail.gmail.com>
 <CAHC9VhTDGwO789t59EyOV0SwnwGrdyBhRiuJpoY7cB4MSe02BQ@mail.gmail.com>
 <e2b6ae44-1037-666f-5012-6abd4d46c0b7@schaufler-ca.com>
 <CAHC9VhQ+UcJw4G=VHNE8wMa+EBG-UcoZ7ox0vNqLHoSKAd9XZQ@mail.gmail.com>
 <269014c6-5ce6-3322-5208-004cb1b40792@canonical.com>
 <CAHC9VhRrOgDMO9fo632tSL7vCMAy1_x3smaAok-nWdMAUFB8xQ@mail.gmail.com>
 <1958a0d3-c4fb-0661-b516-93f8955cdb95@schaufler-ca.com>
 <CAHC9VhQPvcunvBDvSnrUChwmGLen0Rcy8KEk_uOjNF1kr4_m9w@mail.gmail.com>
 <6552af17-e511-a7d8-f462-cafcf41a33bb@schaufler-ca.com>
 <CAHC9VhQMeyxQJSAUuigu=CCr44WtpJg=LEh1xng_bPfCCjqq6Q@mail.gmail.com>
 <5ef4a1ae-e92c-ca77-7089-2efe1d4c4e6d@schaufler-ca.com>
 <CAHC9VhQRpeOMkeEfy=VRPnpuYMUDYgLp56OjQZPYwoXmfHYREQ@mail.gmail.com>
 <c679cea7-bb90-7a62-2e17-888826857d55@schaufler-ca.com>
 <CAHC9VhQ-FqURHeuq_3YNH8NixJiGZ9bEEdydu49kC5tLan+FoA@mail.gmail.com>
 <e53a88aa-8fe9-0e0f-ae41-0df17df86a77@schaufler-ca.com>
In-Reply-To: <e53a88aa-8fe9-0e0f-ae41-0df17df86a77@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 27 Sep 2022 18:37:04 -0400
Message-ID: <CAHC9VhR9MyQvuJtupq09Nc307oSRV4K=9iOU6is93yQ3HHmiHQ@mail.gmail.com>
Subject: Re: LSM stacking in next for 6.1?
To: Casey Schaufler <casey@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
Cc: John Johansen <john.johansen@canonical.com>,
 SElinux list <selinux@vger.kernel.org>, James Morris <jmorris@namei.org>,
 Mimi Zohar <zohar@linux.ibm.com>,
 LSM List <linux-security-module@vger.kernel.org>, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 27, 2022 at 4:54 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> On 9/14/2022 6:42 AM, Paul Moore wrote:
> > On Thu, Sep 8, 2022 at 6:56 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> >> I am going to start playing with these syscalls. Please help me understand
> >> where I have suggested something stoopid.
> > Thanks for posting an initial patch that we can use for further
> > discussion.  Time is a bit tight this week due to LPC/LSS-EU so I'm
> > not sure I'll have the time to provide any meaningful comments, but if
> > nothing else it's on my todo list for next week.
>
> With a full understanding that the 6.1 boat has not only sailed but has
> subsequently been sunk by pirates I've posted my v38 stacking patches.
> I would have liked to wait for some amount of "discussion" on the proposed
> syscalls and prctl() options before posting, but it seems that isn't
> going to happen on its own ...

I was happy to see the patches posted, and they are in my queue, but
being away the week of LPC/LSS-EU as well as some other more near-term
patchsets that need review have delayed my ability to review your
syscall patches.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

