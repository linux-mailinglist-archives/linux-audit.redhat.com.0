Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C554653296
	for <lists+linux-audit@lfdr.de>; Wed, 21 Dec 2022 15:44:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671633887;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FZpoJRRX4fr5Do59kMwN9lOyiu+6kPPanONwFSuLuZ4=;
	b=PCNuJUbExxXJKqKD1rlWmkCNsz1bVeRz0oTGkD1bbShPDREsmUiLI1mQ+pOZoM/IxK0rjq
	BOafcQ5o7JZy4txo/KzvFYcLZi1QboiPhULDB2Mi2AIvsd5ZtPnsW4DUfI2HcPBU5cb4YW
	3irao2uBqrrRUHoNV735LCJgOJK26A8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-xlAfwz-uN6SlHcPjlS-3bA-1; Wed, 21 Dec 2022 09:44:43 -0500
X-MC-Unique: xlAfwz-uN6SlHcPjlS-3bA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 546A7857F82;
	Wed, 21 Dec 2022 14:44:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 69185492B02;
	Wed, 21 Dec 2022 14:44:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 37CB61946A70;
	Wed, 21 Dec 2022 14:44:32 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B03F119465A4 for <linux-audit@listman.corp.redhat.com>;
 Wed, 21 Dec 2022 14:44:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8DE751400AFC; Wed, 21 Dec 2022 14:44:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 864221410DD7
 for <linux-audit@redhat.com>; Wed, 21 Dec 2022 14:44:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B70C8028B0
 for <linux-audit@redhat.com>; Wed, 21 Dec 2022 14:44:31 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-668-El98zL1XONCkXh0j1KlMQQ-1; Wed, 21 Dec 2022 09:44:29 -0500
X-MC-Unique: El98zL1XONCkXh0j1KlMQQ-1
Received: by mail-pl1-f180.google.com with SMTP id b2so3035669pld.7
 for <linux-audit@redhat.com>; Wed, 21 Dec 2022 06:44:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zs4lAshndqOuEw+okQsiQ8t1pmpOKSIiuHcIdnQ13BI=;
 b=hVpDDGGr2jSpguGqEyrCn1Dz8yApJeBxH9oVC7EwNnan7LzqhdHiJvPhRGRhRADPYE
 H6/3SbjIJQZePz73fJc5bE1cw11fTxiX0COj3s2QyD97YVqPMY+TaWcRk0icW9gwXbFK
 B0EUDQE8b3UqIlkYocLpOymuCfyIwZFzqLixecmRzOloTN6X54y7+GXTXsmx2PIKE1Pt
 KpOAscBIg2wYVduPJw+L8YEGZxIAgNi2zhvSqKKbL8xdCRZLQmBhj+TwU3dAf8/zpBpn
 z2SHWlImA+YHVQdR1XWfPoig+Dzb0fRfgHD566H1yZaKOj0YrFrY83ypqwrBu3f4xY+T
 Rlzw==
X-Gm-Message-State: AFqh2kpQSz9/2henSILlalPl/ZSVZOFAp6yY6ywZ81JZAvO2Ex3+J7UH
 DNWGID+O+Es2EnIwLbht5KUe2IwFhCPYECZ5AVq80ua7kZ4f
X-Google-Smtp-Source: AMrXdXtEDzduBv0CYwoN0w5REK76KSdUrFDyJoxq+eKzUUZuoVO23ujmlsZSMAczls4WpOOgdUXKJR6EyWT80CB9n6E=
X-Received: by 2002:a17:90a:8a82:b0:219:b79d:c308 with SMTP id
 x2-20020a17090a8a8200b00219b79dc308mr270976pjn.69.1671633868695; Wed, 21 Dec
 2022 06:44:28 -0800 (PST)
MIME-Version: 1.0
References: <df1eacecc605f856fa80d66d81eddea4dc70ce56.camel@iinet.net.au>
 <5652312.DvuYhMxLoT@x2>
 <602700a68fa5b8d68baef4368eaa5e8adf3799a3.camel@iinet.net.au>
In-Reply-To: <602700a68fa5b8d68baef4368eaa5e8adf3799a3.camel@iinet.net.au>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 21 Dec 2022 09:44:17 -0500
Message-ID: <CAHC9VhSNq5xzpB2jzxK5oFQAM2uGefihCYH0iq91=0Lm=D8jig@mail.gmail.com>
Subject: Re: BPF audit logs
To: burn@swtf.dyndns.org
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
Cc: Linux-Audit Mailing List <linux-audit@redhat.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 20, 2022 at 7:02 PM Burn Alting <burn.alting@iinet.net.au> wrote:
> And to cap this off, the program id will always be zero on an UNLOAD, as
> the routine that sets it to zero, kernel/bpf/syscall.c:bpf_prog_free_id(),
> is called before the emit audit event routine, kernel/bpf/syscall.c:bpf_audit_prog().
>
> So a bug!

Ooof :/  Independent of the other issues this is something we should
fix as soon as we can.  I'll take a look during the holiday and see
what we can do to fix this; looking quickly at it now I don't think it
will be too bad, but one never knows for sure ...

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

