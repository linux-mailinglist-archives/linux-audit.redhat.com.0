Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9F6061FC020
	for <lists+linux-audit@lfdr.de>; Tue, 16 Jun 2020 22:38:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592339935;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=X8duCyTQaXguc0Y/Iz5btUauAbhfTof5yzkIF1DE9PY=;
	b=EZrjig4Gh/FlpDyh3pIz/eLwms6h4a9H2OU7Ff/k30kD5YyYOnQzUjlFTzl22UmZBnyh7M
	2tLs/dkLZIWUyXdm2To93LBynXAgC14G2AYgJfdoK+JORnYLBUZyo2hSRJc1qPVg3KqLQ1
	CPQpJquP9da7UZXRilRUpvk8NsnKQ14=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-9M7gFW8rNMKgBgPuLVoFFQ-1; Tue, 16 Jun 2020 16:38:53 -0400
X-MC-Unique: 9M7gFW8rNMKgBgPuLVoFFQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CECA107B467;
	Tue, 16 Jun 2020 20:38:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5967A6EDBE;
	Tue, 16 Jun 2020 20:38:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BEFDD1809547;
	Tue, 16 Jun 2020 20:38:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05GK5TdA030618 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 16 Jun 2020 16:05:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 29DDA10DCF7B; Tue, 16 Jun 2020 20:05:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22F841004049
	for <linux-audit@redhat.com>; Tue, 16 Jun 2020 20:05:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 704EC811E7A
	for <linux-audit@redhat.com>; Tue, 16 Jun 2020 20:05:26 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-474-6XhS9TEQPC2J-pLV-RPfKg-1;
	Tue, 16 Jun 2020 16:05:22 -0400
X-MC-Unique: 6XhS9TEQPC2J-pLV-RPfKg-1
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from legacy ([80.109.83.31]) by mail.gmx.com (mrgmx105
	[212.227.17.168]) with ESMTPSA (Nemesis) id 1MI5QF-1jiF5Z1WmV-00FEkd
	for <linux-audit@redhat.com>; Tue, 16 Jun 2020 22:00:18 +0200
Date: Tue, 16 Jun 2020 22:00:17 +0200
From: Stefan Tauner <stefan.tauner@gmx.at>
To: linux-audit@redhat.com
Subject: Error handling of auditctl -w
MIME-Version: 1.0
Message-ID: <1MXp9Y-1jOF6E24IW-00Y8HI@mail.gmx.com>
X-Provags-ID: V03:K1:vBMF0410NN1Gm2hvrnkkD2O8J3y/gYEWjzkGrCQ0D4QPRDdyWU2
	yFG4NV6Y1Np0rUtP6ThBakAuM2n+1ZIL7ptJ3hBV8zimLm1pLrGKkBUM8AeIpWcXBf6Zm6i
	6C5nZYAz4uJ7kIMs6q3e0hUnn2CuylksIOjzfxiZOCi+e5PjFWCyHTk55ZWwOJJ7l0WWQfg
	ZmMp8tLGnaSmB+doyj5Pg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eoi6j1yfvQE=:dRdxe+49cO4XLwEoWGJJcs
	jQxye97oSBCPwvV0MrTWUBfDtNMYk4wyC8VLiL47clZErm02rr0oFQBG4tmLw/fKQYlxIFauS
	wsOHZNxOq+vnZ/aua7OBJw2O5E/ofN4ci8lHlTXdbu3SkbePrIRP8XpCGxK9DuF9d5Lr1Qo0F
	kKAXx8ic9tJjKXECM3HSv0q+qmEfpMAnx9ko9Bwk62OlIwqoMYLEesl5T2xUldEflPfjST3bl
	g/pW3npjFRXh3ntPCLnygIrqZf8kAO0Tvoy2RcIVBBVEaXWCho9ss88m/yNTCH7OTdsDyal3i
	d9FRuKEkNYKm0eYCRAJCXjqpvIXuUdJvfeWbeoAb+SAw6Ra313jffoxDcqKa6samidTRAVGUS
	9JkmdxA+6xmgT5sAf886QTGvO2TTJJEdkqeokbpVk/YJx8yp8BdYoJGwH13Byo1zO0xaN3XBI
	um9w0ShkC0JtmGDMuMqbinOl73bjslhxGMvKO92o5G2xwVt09aCfl8DIP7eB9cuZBHBI5+qVj
	9CkKEl7xlcUA0CsYIrOj6eWtoRsVEjfpJEwrZwS2O6jdbfFbMGKupDhZKZVXl6SnrHyFfCCEU
	3IPCYRkzi2d7RcbpP1HnazWB5y+jXOBgE0v3dDn2gJNCSI0Nh1Oo3KhCwPYDWv5JEZmZzLIMq
	TkUfL/CruikAwbTPgFhnvC9E7q3AezFT/cU8u1ict762eulo2uRLJ5OTETpj9Bq4yMntczC8+
	pleERVwC9+sQH55jCieBlsQOi7fZV7wyrnjp6I39A6dkcmFLVTj3t6Usn9Q/5iD0042uUwWwB
	v6VCNTTvH5tr2sd+tbrG4upXEOVXRWWsSmBLKkTXeUf9HAOv/+2n3JSZrKz/lyKADkap5pxU3
	XBl9HzFVZ+JY4wxrnE6phxuifxxKWekRiIqgtElwxYEWIC5ELVmvi/N9FpxGbHRwjFFUk37qf
	py+cgUNVKqiXnTGJXGlk5kLoeU/ejyTLuYoPENK0Tf4+Xc9RYrL9diTE7kApNDgrYTq99ng/o
	ZYMPIzN/Wk40oVpEEtUzIRmcRs4kWqqsp1/eDSOh6X+PhoCvzRoTZRaqVxS9I09/o/zzTbFMS
	eFLQ5Mpt+ZGAi+CLiuZbzIGcp1g03unWtL7m0KBM3cu/WCZxecKlxQeUSSpDFgp8qSTf9qU01
	BVLbU4/t18QyGJN6TgnrI8aScirru0gaQjpo99Aa2w8RvSbbgh2OMI5ED31cJAmz1kMaPKPSG
	m6qXEo/nMGmtqgctc
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05GK5TdA030618
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 16 Jun 2020 16:38:16 -0400
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksCgpJIHdhcyB3b25kZXJpbmcgd2h5IG15IGF1ZGl0Y3RsIGV4ZWN1dGlvbnMgZG8gbm90IHBy
aW50IGFueSBlcnJvcnMgYnV0CmFwcGFyZW50bHkgZGlkbid0IGRvIGFueXRoaW5nLiBBZnRlciBj
aGVja2luZyB0aGUgcmV0dXJuIHZhbHVlICh3aGljaAp3YXMgMjU1KSBJIGxvb2tlZCBhdCB0aGUg
Y29kZSBhbmQgbm90aWNlZCB0aGF0IGF1ZGl0X3NldHVwX3Blcm1zKCkgYW5kCmF1ZGl0X3VwZGF0
ZV93YXRjaF9wZXJtcygpIGhhdmUgdmlydHVhbGx5IG5vIHVzZXItdmlzaWJsZSBlcnJvciByZXBv
cnRpbmcuCgotLSAKS2luZCByZWdhcmRzL01pdCBmcmV1bmRsaWNoZW4gR3LDvMOfZW4sIFN0ZWZh
biBUYXVuZXIKCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0
LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQ=

