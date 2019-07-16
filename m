Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA636ACD5
	for <lists+linux-audit@lfdr.de>; Tue, 16 Jul 2019 18:33:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D11503066752;
	Tue, 16 Jul 2019 16:33:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 408CD19C68;
	Tue, 16 Jul 2019 16:33:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 571991800207;
	Tue, 16 Jul 2019 16:33:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6GGXbLC001267 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 16 Jul 2019 12:33:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 56E2719C71; Tue, 16 Jul 2019 16:33:37 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 513EA19C68
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 16:33:35 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DB93C81F1B
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 16:33:33 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id i2so10399588plt.1
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 09:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=magitekltd-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=pfeVDXbVXHSWjQ/3uFOhndI6e1fRYp+M3yee9i6fjvM=;
	b=i2L2aHmMpXnBq0OcTngUji0mi3uGLlIOJTLxBj7265mBPGgfJHtAHjr/T7X3JOJ3pU
	SWO7dk5fgvWDN+SELzhhXJFGlfNT8Hak7fOTDPtO6p1XZzvRxHjdT9Br5x84SA2vFzy0
	2YF0fHd2+Q0rID1LYJiQ2itriY0XbgbGM/pgGEUG314bdRnMx9s+lrYbNfwjMppW42x6
	ptyd5Yj6q94Bh7s9iH4vs9XVlTW4kGiSS2TTQqfElDeKTtyTiBWTPj7SpyEFRkP3XAyL
	vsSL3cH85875bBDzKwNo2DHHJnwNw5pAFJUHk5awQQbw9rZFnb4JAYeIs3hI2nFAH47g
	dTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=pfeVDXbVXHSWjQ/3uFOhndI6e1fRYp+M3yee9i6fjvM=;
	b=AoLddIdX4qdSIHTbpxhmSPNDEanc78URm2SQTSkVOhiIEWtLH1IaHLqT9i6Zv9C7pS
	DLnn6R+Q+QS/F8sjkjPfwJwMIJ2mlH+6k/AtO2RnVk3f+pC9poyRyQnsoX7MKnZNF7o5
	btftOXauntCPcFRwkr6/yUFQnQe2CKnAXIYCr2K+JzRaT8YYV1HefUyBdCgqaLsS1t6f
	g6juwGRYsO44oM/QryCHXhqUle2zur9VIkluY0SAzbcq0wHsmDqayKb6fW4TVCRTnqlp
	04wD3KYjA6b3QbdB4m3159bx3LdcWu57oxJZ4Jiag5KG19+L6h2JnHlOdoLtprAvba57
	wxPw==
X-Gm-Message-State: APjAAAW4MEcjPtdS7T4CsBgnHIK4zcakykhPVG/yLsAKsOwkQm36Q0KY
	k8ioiM36IFuacMpG2eMLuR49Bu2i
X-Google-Smtp-Source: APXvYqzKM+oaWuapfeon64/1irLCOmVSMSV2zGI/lWNtySmopsZQmeQONm9+nMsaQt6xkAp6JQhJOw==
X-Received: by 2002:a17:902:27e6:: with SMTP id
	i35mr36745629plg.190.1563294813136; 
	Tue, 16 Jul 2019 09:33:33 -0700 (PDT)
Received: from [192.168.1.159] ([47.187.37.81])
	by smtp.gmail.com with ESMTPSA id
	e11sm26085298pfm.35.2019.07.16.09.33.32 for <linux-audit@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Jul 2019 09:33:32 -0700 (PDT)
Subject: Re: Preferred subj= with multiple LSMs
To: linux-audit@redhat.com
References: <f824828c-5c9d-b91e-5cec-70ee7a45e760@schaufler-ca.com>
	<1979804.kRvuSoDnao@x2>
	<2802ddee-b621-c2eb-9ff3-ea15c4f19d0c@schaufler-ca.com>
	<3577098.oGDFHdoSSQ@x2>
From: Lenny Bruzenak <lenny@magitekltd.com>
Message-ID: <201113d1-192f-d6b3-17bb-bcf219bc5f15@magitekltd.com>
Date: Tue, 16 Jul 2019 11:33:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <3577098.oGDFHdoSSQ@x2>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 16 Jul 2019 16:33:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Tue, 16 Jul 2019 16:33:33 +0000 (UTC) for IP:'209.85.214.174'
	DOMAIN:'mail-pl1-f174.google.com'
	HELO:'mail-pl1-f174.google.com' FROM:'lenny@magitekltd.com' RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 209.85.214.174 mail-pl1-f174.google.com 209.85.214.174
	mail-pl1-f174.google.com <lenny@magitekltd.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Tue, 16 Jul 2019 16:33:45 +0000 (UTC)

On 7/16/19 11:14 AM, Steve Grubb wrote:

> Quoting has a specific meaning in audit fields. So, we really shouldn't do 
> that. We can simply pick another field delimiter. I really don't care which it 
> is as long as its illegal for use in a label. For example, we use 
>
> #define AUDIT_KEY_SEPARATOR 0x01
>
> to separate key fields. We can pick almost anything. (exclamation mark, semi-
> colon, hash, plus symbol, tilde, 0x02, whatever) But it will need to be 
> documented and put into the API so that everyone is aware of the convention.
>
> -Steve


Also should it not be the "#define AUDIT_INTERP_SEPARATOR 0x1D" for
enriched format records?

LCB

-- 
Lenny Bruzenak
MagitekLTD

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
