Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 781AD6064E0
	for <lists+linux-audit@lfdr.de>; Thu, 20 Oct 2022 17:45:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666280709;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KEnoQVM4jdVaQp38ArspiM1Y0TZzqAWygsFxwqaJlXs=;
	b=Olqk1S2EI2XEFrdN0zBiQ8VFVZNOex0y89k49bHKNpsF6LV5tTVFmcY+hlr/s6ND1ozLCI
	EQdwIYH5CrAxttRN7Se+TbaXkCvUA/vc18VkWg8WwgFvhFdgJhC1uMGMKqUQZrre77Q4+g
	Ejjzg8es2G9hXRVbcIpBBJSGF549rPo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-rZwP1geXN9qP37Y06Q6ePA-1; Thu, 20 Oct 2022 11:45:08 -0400
X-MC-Unique: rZwP1geXN9qP37Y06Q6ePA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D59C3C0F432;
	Thu, 20 Oct 2022 15:45:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C2D3E4047AC;
	Thu, 20 Oct 2022 15:44:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C60A219465A4;
	Thu, 20 Oct 2022 15:44:57 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 141FF1946587 for <linux-audit@listman.corp.redhat.com>;
 Thu, 20 Oct 2022 15:44:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EDFD92166B40; Thu, 20 Oct 2022 15:44:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D74742166B33
 for <linux-audit@redhat.com>; Thu, 20 Oct 2022 15:44:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9AAB185A78B
 for <linux-audit@redhat.com>; Thu, 20 Oct 2022 15:44:55 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-120-ZjfH7OZ4P0q3mGpgGo9cSQ-1; Thu, 20 Oct 2022 11:44:53 -0400
X-MC-Unique: ZjfH7OZ4P0q3mGpgGo9cSQ-1
Received: by mail-yb1-f174.google.com with SMTP id e62so48636yba.6
 for <linux-audit@redhat.com>; Thu, 20 Oct 2022 08:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vuJ1OX3Cxr4MI7P448IfdHAHrYdLDVJPbpwIxu/boEU=;
 b=e1FrT8pUvtbVA/bEVOwbxYV3SS5V2kzItJSfd/DYBDLTkCESfLV8ss+ymrOynhHY27
 OYdqa2OEvklSSFiUHgrMt0ja0X+upnyJ4sP3icWhRLmrt/UTKl/YyLpbRg+7uX6sLehz
 tAlZQnhZghb3qToOoV+0gN6T6kAEZf+cWX3TOedPp3X1pQnGPBrnTIDzef8IuOGe/zh1
 dfZAe+7KE6D2b5FfEG531lXyZAWw1t8IV9orjnRlUvnPwEPglYEgY4T7bvW5bdAG9AS2
 R3ern8cXZhp/mBS9Ju9UJ7PWbyZ6Sl1kleKE2v+2xPmfovd/Y9Z6sMmEq5ndJqjSso5G
 LxWw==
X-Gm-Message-State: ACrzQf16kZeg5J8a5gGsaLLJWEshAF62/RFojsRoShFwokOBBr6G2G04
 3oAI6EIWCBU4cgUVaUuXklQ5R1h/LaFn+ZZQABgp
X-Google-Smtp-Source: AMsMyM5/43dxXX5gedL3EoAC+ilNlRScxaa0bWqmfjUQl7AhYvjk8ffyfXpADkAas0i8D4N5gYdy7izZJXYwLEv6TwQ=
X-Received: by 2002:a05:6902:724:b0:6c0:1784:b6c7 with SMTP id
 l4-20020a056902072400b006c01784b6c7mr11983384ybt.15.1666280693355; Thu, 20
 Oct 2022 08:44:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220927195421.14713-1-casey@schaufler-ca.com>
 <20220927195421.14713-7-casey@schaufler-ca.com>
In-Reply-To: <20220927195421.14713-7-casey@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 20 Oct 2022 11:44:41 -0400
Message-ID: <CAHC9VhQbr1zgyvzM9zB97+rzO-Rcy6CUt_3-54ED-SEanVWyRQ@mail.gmail.com>
Subject: Re: [PATCH v38 06/39] LSM: lsm_self_attr syscall for LSM self
 attributes
To: Casey Schaufler <casey@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
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
Cc: john.johansen@canonical.com, keescook@chromium.org, selinux@vger.kernel.org,
 jmorris@namei.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-audit@redhat.com,
 casey.schaufler@intel.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 27, 2022 at 3:57 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> Create a system call lsm_self_attr() to provide the security
> module maintained attributes of the current process. Historically
> these attributes have been exposed to user space via entries in
> procfs under /proc/self/attr.

Hi Casey,

I had hoped to get to review these patches earlier this week, I know
you are very anxious to see something happen here, but unfortunately
that didn't work out and I'm now in a position of limited network
access and time for a bit.  I will do my best to at least comment on
the new syscall related additions, but thankfully you've already
started to get some good comments from others so I'm hopeful that will
help you keep moving forward.

One comment I did want to make, and it's important: please separate
the LSM syscall patches from the LSM stacking patches.  While the
stacking patches will obviously be dependent on the syscall patches,
the syscall patches should not be dependent on stacking.  However, the
LSM syscall patches must be designed from the start to support
multiple, simultaneous LSMs.

Thanks.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

