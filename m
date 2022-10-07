Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D8A5F7DC1
	for <lists+linux-audit@lfdr.de>; Fri,  7 Oct 2022 21:15:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665170137;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+Or4Azot4HK8HLB84Zu9tQhg8/S0Vqlrx9zWjUDFgxo=;
	b=gfwm9qi5Cw/8Fy9MeGEpr/nsSBPqwFyXhaozfR4XuWj4UG0f+dcWy+Kvf4icGXohEblGso
	C7ZzR2eHL4YVoqBY43H0FWnO84rHjAdGzDPClGd2FocunuPFHeidkx76Wiq6pM+c8FVnmM
	uw34hfmYubx9hvnu5FzzQO6/mWiwHxQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-PmQfL4J1P2iUbjJ2ZiZmhg-1; Fri, 07 Oct 2022 15:15:36 -0400
X-MC-Unique: PmQfL4J1P2iUbjJ2ZiZmhg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93DD329A9CCA;
	Fri,  7 Oct 2022 19:15:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A627E40C6F9F;
	Fri,  7 Oct 2022 19:15:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 555101946A6D;
	Fri,  7 Oct 2022 19:15:23 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0B28A1946595 for <linux-audit@listman.corp.redhat.com>;
 Fri,  7 Oct 2022 18:23:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D277F40EFB3C; Fri,  7 Oct 2022 18:23:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA63E40F2B95
 for <linux-audit@redhat.com>; Fri,  7 Oct 2022 18:23:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACCE81C004E7
 for <linux-audit@redhat.com>; Fri,  7 Oct 2022 18:23:02 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-635-qqzHfRKqPgqLebvYZIsysw-1; Fri, 07 Oct 2022 14:22:51 -0400
X-MC-Unique: qqzHfRKqPgqLebvYZIsysw-1
Received: by mail-il1-f171.google.com with SMTP id u10so2912728ilm.5
 for <linux-audit@redhat.com>; Fri, 07 Oct 2022 11:22:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tqdk0hM6x7C5GmuwpualrefrDZUl2Sr4Ok7Sj1B+cIU=;
 b=q1Q+N8Xs/e1fDyXrAFtpE51VnoMrlwOhjv5kqTDomlujzrdzPPtCJSd2IMBmm7fmIo
 zRGeC/hC9AeiQDCjlaGVQTf/TvsDNIF0LNk4J+aHdrQvNCZhnIChG9iCfkPN39RW1De1
 rBE162qB6XLXRjbh8oRp47z/JkJMio67ESv5XNYiEZpz1ddcO78Xh83+QstoEcaIezK8
 8CPeocW2kaFM8XVSIa9FVZ2bCcT+0Dx+W2uEgzQNgA8CjpOHwL/T14N3iA6jBjggo0+0
 UNeRcVRk21uZyn54yS6bdLzUg7qbN1Ry7LTKijXLKQbqOL+uuo2aIyjDFdsbggbOaGjf
 o+Ew==
X-Gm-Message-State: ACrzQf0EfPiEKPTsZ95taI7qqUe0O2K7zTazytfHTERCFX93LDYSiNxI
 2MXwSGlftihAtJb+EmQegB6FhQ==
X-Google-Smtp-Source: AMsMyM7IhRaQr3ziBNux5greMX2VvHfaaC7TIUUhff14ccB3j20v1brVoOrflHvId5ctKzMAi5DOcw==
X-Received: by 2002:a92:c208:0:b0:2fa:abf:9d48 with SMTP id
 j8-20020a92c208000000b002fa0abf9d48mr2923600ilo.127.1665166970015; 
 Fri, 07 Oct 2022 11:22:50 -0700 (PDT)
Received: from [192.168.1.94] ([207.135.234.126])
 by smtp.gmail.com with ESMTPSA id
 ay27-20020a056638411b00b00362684ca750sm1146440jab.68.2022.10.07.11.22.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Oct 2022 11:22:49 -0700 (PDT)
Message-ID: <8647a8d9-a5d0-de35-9639-22bdcb44716a@kernel.dk>
Date: Fri, 7 Oct 2022 12:22:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: IORING_OP_SENDMSG_ZC should enable auditing just like
 IORING_OP_SENDMSG
To: Paul Moore <paul@paul-moore.com>, Pavel Begunkov <asml.silence@gmail.com>
References: <CAHC9VhSzQtFkksJ5zBnhOYCpvDGNjjn7SKoC4MmopepWzb+Hfg@mail.gmail.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAHC9VhSzQtFkksJ5zBnhOYCpvDGNjjn7SKoC4MmopepWzb+Hfg@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Fri, 07 Oct 2022 19:15:21 +0000
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
Cc: linux-security-module@vger.kernel.org, linux-audit@redhat.com,
 io-uring@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/7/22 11:34 AM, Paul Moore wrote:
> Commit 493108d95f14 ("io_uring/net: zerocopy sendmsg") added a new
> zerocopy sendmsg command to io_uring, but it enabled the
> io_op_def:audit_skip flag, causing the operation to bypass auditing.
> As far as I can see, the SENDMSG_ZC operation should be subject to
> auditing just as SENDMSG.

As far as I can tell you're right, it's not audited further down.
I'll add a patch getting rid of that audit_skip for SENDMSG_ZC.

-- 
Jens Axboe


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

