Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C01A3E0915
	for <lists+linux-audit@lfdr.de>; Tue, 22 Oct 2019 18:36:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571762193;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wHrHJn6JaYSvnZjBNroR0xfeBKDmC+mnghhwI3HGYGc=;
	b=SPws6WRveOJ1108Lk2cYbZOvXmFFrxGBimgooqKd0v5YXfaoQyd2dUNlSEdO15bpzLVKDs
	z5KUx/3MDVJGIFJ9QjPTp73j8zgQaEjw3qdjzp9CKarDfj14W/GVmkOZTlQHlcmSxmB+Vy
	7uHX59awV6Q2RYNUBwTPNF6V2j0atJo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-lzhdr5XqP1ukQA47Rxn6Kw-1; Tue, 22 Oct 2019 12:36:31 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78CC8800D54;
	Tue, 22 Oct 2019 16:36:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D9625D6B2;
	Tue, 22 Oct 2019 16:36:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D8F3B4E9F5;
	Tue, 22 Oct 2019 16:36:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9HL6Box015712 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 17 Oct 2019 17:06:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BA06A5D71C; Thu, 17 Oct 2019 21:06:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx26.extmail.prod.ext.phx2.redhat.com
	[10.5.110.67])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B413F5D712
	for <linux-audit@redhat.com>; Thu, 17 Oct 2019 21:06:09 +0000 (UTC)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
	[209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A431A89B007
	for <linux-audit@redhat.com>; Thu, 17 Oct 2019 21:06:08 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id f1so862370vkh.9
	for <linux-audit@redhat.com>; Thu, 17 Oct 2019 14:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=paUqDrWcD4rUxoXa7lCXwJk5Dv1jZeoHAVkupu0sOO8=;
	b=uEDsVmUkKKl3mWAOXBahs0l7BbimP/KWVlW9NbIRvuifymL8p1tgp9upHJxepfQewy
	rmjo6wvUaphWWBGVhaJkwYRyQXXEFT0pSRVW0A74Ch6r7f9kXqWeTem54lX8HkSLifiP
	GBh8MDgpYOPyk4owWShTAyMucMCI8a8Uo34oyBYT5GEeF0jX315ZXOj1PzZVQhGqjb1h
	wU2GbKVLWDNnfpqtE0iyJSOMNHM11nxeNG2Dgt6Or5wDyqunTGTlYDAAW/1am4pzV82k
	YukZBCRSNtzK68vghJ59FzKgR4XkA2GmWy3gX7WnF3u3lUIG2h+Mi3kObiSjRNax9DAm
	IqeA==
X-Gm-Message-State: APjAAAUp1swy1KIAofCf2SdkkDL+72P+vvjwtyEr8cakbKLYHDJgFG5T
	v439jCVZM/ENO0Rt12nSr2Ire4FqqNbIliprhoOdHnYC
X-Google-Smtp-Source: APXvYqyac9X8k4eqYxWuXYrlnngoFohunrFVWdSL79V4fby4H5dmK1LpjOsTwWpEv3xp0MvpOLXoPtBCmU0Rb7k632U=
X-Received: by 2002:ac5:c76e:: with SMTP id c14mr3329400vkn.14.1571346367501; 
	Thu, 17 Oct 2019 14:06:07 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Date: Thu, 17 Oct 2019 23:05:56 +0200
Message-ID: <CAJ2a_Dcm0ehsAPUb27DdamBbho7=RMhHxeFrM=yKz+vcAN-dpA@mail.gmail.com>
Subject: shadow: what uid to log?
To: linux-audit@redhat.com
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.67]);
	Thu, 17 Oct 2019 21:06:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]);
	Thu, 17 Oct 2019 21:06:08 +0000 (UTC) for IP:'209.85.221.176'
	DOMAIN:'mail-vk1-f176.google.com'
	HELO:'mail-vk1-f176.google.com' FROM:'cgzones@googlemail.com'
	RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.176 mail-vk1-f176.google.com 209.85.221.176
	mail-vk1-f176.google.com <cgzones@googlemail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.67
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9HL6Box015712
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 22 Oct 2019 12:36:07 -0400
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: lzhdr5XqP1ukQA47Rxn6Kw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksCkkgYW0gd29ya2luZyBvbiBtaWdyYXRpbmcgc3JjOnNoYWRvdyB0byB0b2RheSdzIFNFTGlu
dXggYXBpIGFuZAplbmFibGluZyBhdWRpdCBsb2dnaW5nIGZvciBkZW5pYWxzLgpUaGUgcXVlc3Rp
b24gd2hpY2ggdWlkIHRvIGxvZyB3aXRoICdhdWRpdF9sb2dfdXNlcl9hdmNfbWVzc2FnZScgY2Ft
ZSB1cC4KV2hhdCBpcyBwcmVmZXJyZWQgZm9yIHRoZSBhcHBsaWNhdGlvbnMgbGlrZSBwYXNzd2Qs
IGNoZm4sIC4uLiAsIHdoaWNoCm1pZ2h0IGJlIHNldHVpZCBiaW5hcmllcyAoZ2V0dWlkLCBnZXRl
dWlkLCAwKT8KCktpbmQgcmVnYXJkcywKICAgICBDaHJpc3RpYW4gR8O2dHRzY2hlCgotLQpMaW51
eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL3d3dy5y
ZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQ=

