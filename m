Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3869B2068EC
	for <lists+linux-audit@lfdr.de>; Wed, 24 Jun 2020 02:16:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592957791;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=x1ptV2cYG6gPaLSSOrn66sCxXHDjs78MkWyWV4guH5g=;
	b=AdcEX+M+mwYvDEd2RvO+SmDBJzW1nxIYRrSWPk+o/wVfhddcEkI73cTq71Gf88Pt5/RL3Q
	Cp39O4QF05ePD+tMTId8d4KG+LXc5uzWVeQPrCh6a3QkQ4V58lSlQEuh/ZIeSmdRe/Nqin
	0FpDUrttK2TIOL69sbK9qKNzBWQJhG0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-belGyw5mNSa6olK3sRLehg-1; Tue, 23 Jun 2020 20:16:29 -0400
X-MC-Unique: belGyw5mNSa6olK3sRLehg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 184DA8015F0;
	Wed, 24 Jun 2020 00:16:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9288891E6;
	Wed, 24 Jun 2020 00:16:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 318D5180954D;
	Wed, 24 Jun 2020 00:16:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05O0GFan016677 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 23 Jun 2020 20:16:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C44712156A59; Wed, 24 Jun 2020 00:16:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF8B92157F24
	for <linux-audit@redhat.com>; Wed, 24 Jun 2020 00:16:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB4918007C9
	for <linux-audit@redhat.com>; Wed, 24 Jun 2020 00:16:13 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-319-dFAnvqrOMh2AfF-cIPYvvQ-1; Tue, 23 Jun 2020 20:16:11 -0400
X-MC-Unique: dFAnvqrOMh2AfF-cIPYvvQ-1
Received: by mail-ed1-f66.google.com with SMTP id g1so140701edv.6
	for <linux-audit@redhat.com>; Tue, 23 Jun 2020 17:16:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Yxg7/n7SiHxWrfdRk2MGKI2te93s1X2qumOeLQwLTJ8=;
	b=KStugK1tn5LFGU+V3WhwOGaEueyhU2i4ibE4XxNSRs1HyxAoCZ8QKrrKuDejlVzYvm
	c4mQLXLiGS12QmjrDkz/iYjMSQ/GoHmU4afySDIMbeZnu0AaBC/k7jeDj7lrFJRtjRKp
	mDGhK5yZusioBGtYBm+FtDS+vVgMwmfw7/iZmCOmMhQbqVBc19VyVCJ6Bk7pBjgr7u03
	nk/DZwSHYNr0AiwyyhtSGeC99U3rQWTEJ/25W/Ax+6aHsdPlYRk+xcEyRAGik8RLJdsg
	wHxVFkliDwCECJJ/Dw68eD+Q7wNTo3DcDIa1BNvFLzUHhBx1quehbDuU8TtQfobkKtdI
	yCqA==
X-Gm-Message-State: AOAM5316dNt6miget/TSJdXJWW79sa6RClARc/RqokXy45equC6PXFga
	hP20Neh9v6NTkg+eqH0Ej07gqSLEe+v3kz1Se7SNOZQ=
X-Google-Smtp-Source: ABdhPJwnBJta1pP0Ys7XAOPSD1a9FmuiNTyt3pzfICA+U8pPMO3bO66YyVBYdGdMCd/A5GmxveVDaogrSNIcmx+5gVM=
X-Received: by 2002:aa7:de08:: with SMTP id h8mr23643976edv.164.1592957770210; 
	Tue, 23 Jun 2020 17:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200616045855.GA1699@linux-kernel-dev>
	<CAHC9VhSotFw2i7HzWrHUyc6VSbwTpv8ZBeP58H_mzi6bd=Uouw@mail.gmail.com>
	<20200617225416.GA2688@linux-kernel-dev>
	<CAHC9VhQYaZAm4oRg4h2TiuhPR+CWp8yU4Sviao64MWwVw6nigw@mail.gmail.com>
	<20200618234836.GB3975@linux-kernel-dev>
	<20200619003009.yt5xdcpw6vggiwkl@madcap2.tricolour.ca>
In-Reply-To: <20200619003009.yt5xdcpw6vggiwkl@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 23 Jun 2020 20:15:59 -0400
Message-ID: <CAHC9VhSWsX5bYX2oGhEsmWTQVk6F7S3JxJi0tmjUEo3sStXbPw@mail.gmail.com>
Subject: Re: [PATCH] audit: optionally print warning after waiting to enqueue
	record
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05O0GFan016677
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBKdW4gMTgsIDIwMjAgYXQgODozMCBQTSBSaWNoYXJkIEd1eSBCcmlnZ3MgPHJnYkBy
ZWRoYXQuY29tPiB3cm90ZToKPiBPbiAyMDIwLTA2LTE4IDIzOjQ4LCBNYXggRW5nbGFuZGVyIHdy
b3RlOgo+ID4gSW4gY2FzZSB5b3XigJlyZSBhbnkgbW9yZSByZWNlcHRpdmUgdG8gdGhlIGlkZWEs
IEkgdGhvdWdodCBJ4oCZZCBtZW50aW9uCj4gPiB0aGF0IHRoZSBuZWVkIHRoaXMgcGF0Y2ggYWRk
cmVzc2VzIHdvdWxkIGJlIGp1c3QgYXMgd2VsbCBmdWxmaWxsZWQgaWYKPiA+IHdhaXQgdGltZXMg
d2VyZSByZXBvcnRlZCBpbiB0aGUgYXVkaXQgc3RhdHVzIHJlc3BvbnNlIGFsb25nIHdpdGggb3Ro
ZXIKPiA+IGN1cnJlbnRseSByZXBvcnRlZCBtZXRyaWNzIGxpa2UgYmFja2xvZyBsZW5ndGggYW5k
IGxvc3QgZXZlbnRzLiBXYWl0Cj4gPiB0aW1lcyBjb3VsZCBiZSByZXBvcnRlZCBhcyBhIGN1bXVs
YXRpdmUgc3VtLCBhIG1vdmluZyBhdmVyYWdlLCBvciBpbgo+ID4gc29tZSBvdGhlciB3YXksIGFu
ZCB3b3VsZCBoZWxwIGRpcmVjdGx5IGltcGxpY2F0ZSBvciBydWxlIG91dCBiYWNrbG9nCj4gPiB3
YWl0aW5nIGFzIHRoZSBjYXVzZSBpbiB0aGUgZXZlbnQgdGhhdCBhbiBhZG1pbiBpcyBmYWNlZCB3
aXRoIGRlYnVnZ2luZwo+ID4gZGVncmFkZWQga2VybmVsIHBlcmZvcm1hbmNlLiBJdCB3b3VsZCBl
bGltaW5hdGUgdGhlIG5lZWQgZm9yIGEgbmV3IGZsYWcsCj4gPiBhbmQgZml0IHdlbGwgd2l0aCB0
aGUgdXNlcnNwYWNlIHRvb2xpbmcgYXBwcm9hY2ggeW91IHN1Z2dlc3RlZCBhYm92ZS4KPgo+IFN1
Y2ggYXMgaXMgY2FwdHVyZWQgaW4gdGhpcyB1cHN0cmVhbSBpc3N1ZSBmcm9tIDMgeWVhcnMgYWdv
Ogo+Cj4gICAgICAgICBodHRwczovL2dpdGh1Yi5jb20vbGludXgtYXVkaXQvYXVkaXQta2VybmVs
L2lzc3Vlcy82Mwo+ICAgICAgICAgIlJGRTogYWRkIGtlcm5lbCBhdWRpdCBxdWV1ZSBzdGF0aXN0
aWNzIgoKSSB3b3VsZCBiZSBtb3JlIG9wZW4gdG8gdGhlIGlkZWEgb2YgcmVwb3J0aW5nIHF1ZXVl
IHN0YXRpc3RpY3MgYXMgcGFydApvZiB0aGUgYXVkaXQgc3RhdHVzIGluZm9ybWF0aW9uLCBvciBz
aW1pbGFyLgoKLS0gCnBhdWwgbW9vcmUKd3d3LnBhdWwtbW9vcmUuY29tCgoKLS0KTGludXgtYXVk
aXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0

