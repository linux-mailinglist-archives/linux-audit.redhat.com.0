Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C5A691FA2
	for <lists+linux-audit@lfdr.de>; Fri, 10 Feb 2023 14:16:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676034994;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=d2qrqei94KV3Gx6+l3Z7w0oqSH6jE3hpDWjIe1HXo74=;
	b=HjBbnko9LpulgZB5fMLvibpMehwYm8aO/oELuE6BmG6GnvNNKFy5lEAoAHeXih+yHTSzdS
	k/gEjYfJudrRtDk6+RB9QkKnTf4lLM5C4qnKeR7nxpqkFxZ322szEmqqKo0NfZ3U80a8Do
	nXGdn6Wfs2XPHs4KMG4FCaui9zpxMLc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625--jmoUJK6MwCER9HCqgj5QA-1; Fri, 10 Feb 2023 08:16:30 -0500
X-MC-Unique: -jmoUJK6MwCER9HCqgj5QA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F36638123A8;
	Fri, 10 Feb 2023 13:16:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 900E82166B29;
	Fri, 10 Feb 2023 13:16:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CC3AF19465A3;
	Fri, 10 Feb 2023 13:15:55 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2A5151946589 for <linux-audit@listman.corp.redhat.com>;
 Fri, 10 Feb 2023 01:31:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0B011492B00; Fri, 10 Feb 2023 01:31:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03C10492C3F
 for <linux-audit@redhat.com>; Fri, 10 Feb 2023 01:31:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA371185A7A4
 for <linux-audit@redhat.com>; Fri, 10 Feb 2023 01:31:32 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-341-yoSFx-jEPHG8EJzQxu78bA-1; Thu, 09 Feb 2023 20:31:31 -0500
X-MC-Unique: yoSFx-jEPHG8EJzQxu78bA-1
Received: by mail-pl1-f176.google.com with SMTP id u9so4958658plf.3
 for <linux-audit@redhat.com>; Thu, 09 Feb 2023 17:31:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1675992690;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PKcbLZcajSuwCxPytCg/HAwDqNSvxwjiKjN+WJdXM3g=;
 b=OBG03KUOGyPIzbMGmUq4EZ+xVY8p0X7arw9zSP6ZIoDYQztWtiiViiD7wp5SJscCWS
 NO9rHdGt77CHOx7bsJ4OngmKN4ss8xlgacqCsC5oOuV1Ouiaixil6ccKmHo90lrpRUNr
 q6JevJqEM/yRw917wpSF8E6WHE/J/NhmAb7rht/l7gRSZZ5Z3WAZqcmg/gGsXXsq7Jqs
 ef8DnMUL6Y2ImMr3c68s3baqibXCtktlAq/xOGee3nrcwIdsWkzXJONYGjt/MeYYCnId
 HbHlYi3TNaZerU9gcIhR0NS5VEI7lo8sGLulfsx39f7L7uInK4OeCIDJXFcoKoN2Rk8n
 TJCQ==
X-Gm-Message-State: AO0yUKVXbzORYaWzTa9A1yw4yfZuEX1Lo3TAHUX3ujTalbEDsTqm175R
 Cc/ukwmLg6WWXuvhFLXRnhQ7Lg==
X-Google-Smtp-Source: AK7set99OWZLTEdTRryLAUM9mrpC/FpDRs/UP6g9WHC2xNlVnsAjXH0cTPo+W6bHzuzPoRsWBfmCCg==
X-Received: by 2002:a17:90a:71c5:b0:230:9ae4:b5e4 with SMTP id
 m5-20020a17090a71c500b002309ae4b5e4mr5195710pjs.0.1675992689827; 
 Thu, 09 Feb 2023 17:31:29 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
 b8-20020a17090a550800b0022c0a05229fsm1981832pji.41.2023.02.09.17.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 17:31:29 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Linux-Audit Mailing List <linux-audit@redhat.com>, 
 LKML <linux-kernel@vger.kernel.org>, io-uring@vger.kernel.org, 
 Richard Guy Briggs <rgb@redhat.com>
In-Reply-To: <b5dfdcd541115c86dbc774aa9dd502c964849c5f.1675282642.git.rgb@redhat.com>
References: <b5dfdcd541115c86dbc774aa9dd502c964849c5f.1675282642.git.rgb@redhat.com>
Subject: Re: [PATCH v2] io_uring,audit: don't log IORING_OP_MADVISE
Message-Id: <167599268879.12300.18198007262515314785.b4-ty@kernel.dk>
Date: Thu, 09 Feb 2023 18:31:28 -0700
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Fri, 10 Feb 2023 13:15:55 +0000
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
Cc: Eric Paris <eparis@parisplace.org>, Christian Brauner <brauner@kernel.org>,
 Stefan Roesch <shr@fb.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


On Wed, 01 Feb 2023 15:33:33 -0500, Richard Guy Briggs wrote:
> fadvise and madvise both provide hints for caching or access pattern for
> file and memory respectively.  Skip them.
> 
> 

Applied, thanks!

[1/1] io_uring,audit: don't log IORING_OP_MADVISE
      commit: 2bd59885eb9c2094d118b4321d5f74e12e77ef0f

Best regards,
-- 
Jens Axboe



--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

