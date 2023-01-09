Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE95662BE6
	for <lists+linux-audit@lfdr.de>; Mon,  9 Jan 2023 17:58:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673283497;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HRHMp5sfcjjaWOEmXPJffRsa3xNNh5hWaPYpp0nUjW8=;
	b=CHUcYIduIJjcxvWPCQlvp33+1acF2f7fnDWdqdX9xk3fFeIoaquC0fbKLmjGHvPu64SX+9
	e4NEOpTXGQNTxMxl0Rk7DBBYS+tU4LSW2ATjFnRoFg3weroi0hWD+d1GFiRcAR+S0appK8
	Y0FyrFWG+ib7lQt4vnkXV6QD1xz6+zE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-3iJA1cSzMGSG6tUwZGMWbQ-1; Mon, 09 Jan 2023 11:58:14 -0500
X-MC-Unique: 3iJA1cSzMGSG6tUwZGMWbQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D48B3811E6E;
	Mon,  9 Jan 2023 16:58:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A9A92026D4B;
	Mon,  9 Jan 2023 16:58:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1BD881949744;
	Mon,  9 Jan 2023 16:58:10 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 05D251946587 for <linux-audit@listman.corp.redhat.com>;
 Mon,  9 Jan 2023 16:58:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E739F492C1B; Mon,  9 Jan 2023 16:58:07 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF497492C14
 for <linux-audit@redhat.com>; Mon,  9 Jan 2023 16:58:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2D58811E9C
 for <linux-audit@redhat.com>; Mon,  9 Jan 2023 16:58:07 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-13-Ah2vNc1NOc-_MKUTINGJrA-1; Mon, 09 Jan 2023 11:58:03 -0500
X-MC-Unique: Ah2vNc1NOc-_MKUTINGJrA-1
Received: by mail-pl1-f171.google.com with SMTP id w3so10174826ply.3
 for <linux-audit@redhat.com>; Mon, 09 Jan 2023 08:58:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3xqJBrd6SPYL67jOzvT5AW+KJMn9P6DkyZAxHWX4fqU=;
 b=oi87K8Hw/4oyXTtWGWyFF956neszqQVwncochXrLvFfcq1VuSidmTVMlmm2nQgfX/0
 cTYFCaIVtFUqLxjtvRs3ID7XArZD9CK8ii28wT3GOIHU3LQaBUcaj5i0p3nx49zhpRPJ
 /sh6iBYP1jY/XV+1kdl1Ukr6H2spJY6BaVwGqAGSYoHkUyB5fCAOGCJvPA7vdXtZAZwF
 NUE4sHPZPChRljrf3z9mTNiDlB7Z48bb7v0FGQ5AOrtmm63J47XQpVYhOuDUoydXHuzO
 +tVHnMGyvya2mzn6j/lC4yK/uDUaEhaX5dYzNkTkJTosvEOAUEMBPvKSD+aExI/b0qgN
 vWwA==
X-Gm-Message-State: AFqh2koeH2DwbO6Xn4YLsoUSkVrb50fnvbF/Tf18je3S81WPG13A7P/9
 I8Glq478N3i1cVhmwvafkc8WP3X+VEOs8D4xSzUZe6WPPI7T
X-Google-Smtp-Source: AMrXdXueZbocE48hvD/IK37nUmWMp5nRT6GclnMQhuOkpzqXsL2Ygh1NMZyNVy120e3BLbxPL0tjYgqUj5lSPi4mLgk=
X-Received: by 2002:a17:90b:2352:b0:226:b6e7:aedb with SMTP id
 ms18-20020a17090b235200b00226b6e7aedbmr1995334pjb.69.1673283481164; Mon, 09
 Jan 2023 08:58:01 -0800 (PST)
MIME-Version: 1.0
References: <20230106154400.74211-1-paul@paul-moore.com>
 <20230106154400.74211-2-paul@paul-moore.com>
 <CAKH8qBtr3A+EH2J6DCaVbgoGMetKbLUOQ8ZF=cJSFd8ym-0vxw@mail.gmail.com>
In-Reply-To: <CAKH8qBtr3A+EH2J6DCaVbgoGMetKbLUOQ8ZF=cJSFd8ym-0vxw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 9 Jan 2023 11:57:57 -0500
Message-ID: <CAHC9VhRLSAbSHE1nTGwjuUdMtfwTsRVjhV+eznWRw5Ju_qgDAA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] bpf: remove the do_idr_lock parameter from
 bpf_prog_free_id()
To: Stanislav Fomichev <sdf@google.com>
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
Cc: bpf@vger.kernel.org, linux-audit@redhat.com,
 Burn Alting <burn.alting@iinet.net.au>, Alexei Starovoitov <ast@kernel.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 6, 2023 at 2:45 PM Stanislav Fomichev <sdf@google.com> wrote:
>
> On Fri, Jan 6, 2023 at 7:44 AM Paul Moore <paul@paul-moore.com> wrote:
> >
> > It was determined that the do_idr_lock parameter to
> > bpf_prog_free_id() was not necessary as it should always be true.
> >
> > Suggested-by: Stanislav Fomichev <sdf@google.com>
>
> nit: I believe it's been suggested several times by different people

As much as I would like to follow all of the kernel relevant mailing
lists, I'm short about 30hrs in a day to do that, and you were the
first one I saw suggesting that change :)

> Acked-by: Stanislav Fomichev <sdf@google.com>

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

