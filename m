Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id EFC08134861
	for <lists+linux-audit@lfdr.de>; Wed,  8 Jan 2020 17:47:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578502070;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YdEbhAifBM7jyGmBnmS4WNALOrLAWSpT4jSapzIdwS0=;
	b=L1mTW1FXN+HSu5hEYXGeyJuBSRuZeLvaeh3yReyJH33Cb6W4Noe+Bq17MWGK8LXjbGFI0Z
	7GSZQz2niFE5yZrL3K016HsknCfXuotZ/dhaxnVArF58xmcTiGHJ8B3SSL7oaAcQipXvQ0
	ntoGEmDAPN4UtV2U/OSgIzv6qZulpjU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-znzOUGZLMvmgAsEYlUY5tg-1; Wed, 08 Jan 2020 11:47:49 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BB2D18B9FD3;
	Wed,  8 Jan 2020 16:47:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21EF75C21A;
	Wed,  8 Jan 2020 16:47:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8A71581C94;
	Wed,  8 Jan 2020 16:47:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 008GlLL7013204 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 8 Jan 2020 11:47:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AD04F2166B28; Wed,  8 Jan 2020 16:47:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A72E02166B27
	for <linux-audit@redhat.com>; Wed,  8 Jan 2020 16:47:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0ED51801903
	for <linux-audit@redhat.com>; Wed,  8 Jan 2020 16:47:18 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-420-r1oZPoYUMhSndDTJbGgllA-1; Wed, 08 Jan 2020 11:47:15 -0500
Received: by mail-wm1-f65.google.com with SMTP id p17so3250634wmb.0
	for <linux-audit@redhat.com>; Wed, 08 Jan 2020 08:47:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:reply-to:subject:to:cc:references:from
	:organization:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ODlM0CIKkuqbvn6TyFqbyKvykYoCZutfBb6M9KByNfE=;
	b=pC5bZhEG9ez5HZEFSeL6T8Sm4UI3QOMmepu9r6XZMwgd6Km40jZBlJd2JyBE2WjIE1
	dvEfaBD+PHoLEeHIj7IqSFR+yVoBXijLRWs1S3p/U0sS0E9qYVtWW7KfBzPEasIRqCOm
	t3TglVlnXU1LlmrPEQ9zPQPp16pcAGd1338nXi1iB9NBtBZWD26r51jaJ98nrzi9HT1i
	G90kV9quMo0SunlR6AVNb3huhGqc6jbhS5KPRnth1+GtABUl1/vz9ol360bkMKCY2cJY
	HV1PRrXSvtbBfKsBecZLkkNvk96Jv4L5N9CWhaViLXwFcRLTr4p9dtdVuucCssIzuDzk
	3I+A==
X-Gm-Message-State: APjAAAWKm43I5FeMuWgHYOhlevvOwCOwBM9XuuPAoIgaDca1mhKG4Yi+
	xs/Hhqc8kK561tAyDx552+VkJQ==
X-Google-Smtp-Source: APXvYqwZeX/npX9kHmTB5Cavy4RpYUSbhK4sKOk4mLYZ4U3ylpICSKaWpvMvA+XXctckGNlnulHp4g==
X-Received: by 2002:a7b:c949:: with SMTP id i9mr4939006wml.131.1578502033588; 
	Wed, 08 Jan 2020 08:47:13 -0800 (PST)
Received: from ?IPv6:2a01:e0a:410:bb00:2427:34d:af57:5d8?
	([2a01:e0a:410:bb00:2427:34d:af57:5d8])
	by smtp.gmail.com with ESMTPSA id
	p15sm4156718wma.40.2020.01.08.08.47.11
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 08 Jan 2020 08:47:12 -0800 (PST)
Subject: Re: [PATCH ghak25 v2 1/9] netfilter: normalize x_table function
	declarations
To: Richard Guy Briggs <rgb@redhat.com>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, netfilter-devel@vger.kernel.org
References: <cover.1577830902.git.rgb@redhat.com>
	<194bdc565d548a14e12357a7c1a594605b7fdf0f.1577830902.git.rgb@redhat.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Organization: 6WIND
Message-ID: <f8ee5829-f094-96b8-40c2-b0278f93fb03@6wind.com>
Date: Wed, 8 Jan 2020 17:47:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <194bdc565d548a14e12357a7c1a594605b7fdf0f.1577830902.git.rgb@redhat.com>
Content-Language: en-US
X-MC-Unique: r1oZPoYUMhSndDTJbGgllA-1
X-MC-Unique: znzOUGZLMvmgAsEYlUY5tg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 008GlLL7013204
X-loop: linux-audit@redhat.com
Cc: fw@strlen.de, ebiederm@xmission.com, twoerner@redhat.com,
	eparis@parisplace.org, tgraf@infradead.org
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: nicolas.dichtel@6wind.com
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

TGUgMDYvMDEvMjAyMCDDoCAxOTo1NCwgUmljaGFyZCBHdXkgQnJpZ2dzIGEgw6ljcml0wqA6Cj4g
R2l0IGNvbnRleHQgZGlmZnMgd2VyZSBiZWluZyBwcm9kdWNlZCB3aXRoIHVuaGVscGZ1bCBkZWNs
YXJhdGlvbiB0eXBlcwo+IGluIHRoZSBwbGFjZSBvZiBmdW5jdGlvbiBuYW1lcyB0byBoZWxwIGlk
ZW50aWZ5IHRoZSBmdW5jaXRvbiBpbiB3aGljaAo+IGNoYW5nZXMgd2VyZSBtYWRlLgpKdXN0IGZv
ciBteSBpbmZvcm1hdGlvbiwgaG93IGRvIHlvdSByZXByb2R1Y2UgdGhhdD8gV2l0aCBhICdnaXQg
ZGlmZic/Cgo+IAo+IE5vcm1hbGl6ZSB4X3RhYmxlIGZ1bmN0aW9uIGRlY2xhcmF0aW9ucyBzbyB0
aGF0IGdpdCBjb250ZXh0IGRpZmYKPiBmdW5jdGlvbiBsYWJlbHMgd29yayBhcyBleHBlY3RlZC4K
PiAKW3NuaXBdCj4gCj4gLS0gCj4gMS44LjMuMQpnaXQgdjEuOC4zLjEgaXMgc2V2ZW4geWVhcnMg
b2xkOgpodHRwczovL2dpdGh1Yi5jb20vZ2l0L2dpdC9yZWxlYXNlcy90YWcvdjEuOC4zLjEKCkkg
ZG9uJ3Qgc2VlIGFueSBwcm9ibGVtcyB3aXRoIGdpdCB2Mi4yNC4gTm90IHN1cmUgdGhhdCB0aGUg
cGF0Y2ggYnJpbmdzIGFueQpoZWxwZnVsIHZhbHVlIGV4Y2VwdCBjb21wbGljYXRpbmcgYmFja3Bv
cnRzLgoKUmVnYXJkcywKTmljb2xhcwoKCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51
eC1hdWRpdEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1hdWRpdA==

