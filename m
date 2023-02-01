Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D73685F65
	for <lists+linux-audit@lfdr.de>; Wed,  1 Feb 2023 07:04:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675231441;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=vsLO44tXiWQ5Nt1+ANsehaBTcwSJUIICF10hwG4Al4c=;
	b=UHs3RT7Jk5ZUw3gFBQOfjWClOObvGUC1P+AmuN/f/RJfX4HDaFJ/lNfR0BA8g0TLbeUVOk
	Z5q4vOzXlF4BEfrGSXKNpUTb4rsB6ZvB59mG/UPbhoIe9+DK7ESYolxdfmHcfNOm57NcCy
	ciLWZjVw1QXdImZhudSzAIWX/P4HE0Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-6rCGEPvHOmOZ3I3LAnUIJw-1; Wed, 01 Feb 2023 01:04:00 -0500
X-MC-Unique: 6rCGEPvHOmOZ3I3LAnUIJw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCAAA2A59556;
	Wed,  1 Feb 2023 06:03:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8FE952166B33;
	Wed,  1 Feb 2023 06:03:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D115219465B7;
	Wed,  1 Feb 2023 06:03:49 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 97FEA194658F for <linux-audit@listman.corp.redhat.com>;
 Wed,  1 Feb 2023 06:03:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3145A14171B6; Wed,  1 Feb 2023 06:03:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 294D8140EBF4
 for <linux-audit@redhat.com>; Wed,  1 Feb 2023 06:03:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAD3E1C05AC5
 for <linux-audit@redhat.com>; Wed,  1 Feb 2023 06:03:47 +0000 (UTC)
Received: from sonicconh5002-vm0.mail.kks.yahoo.co.jp
 (sonicconh5002-vm0.mail.kks.yahoo.co.jp [114.110.61.27]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-0nUQlIZYP-GL2L-VuaY85w-1; Wed, 01 Feb 2023 01:03:46 -0500
X-MC-Unique: 0nUQlIZYP-GL2L-VuaY85w-1
X-YMail-OSG: AN06VWoVM1kYrftrpBD7o.Py0ATTk9k.6_hYP56cNHPD8gg1Lr7ZxVO.QAK8MXa
 NXuYwKafMXk6A2u8X8NxgTGNvekGr1l0CZeONEnS2ATcwMAfzYE5xRZFBJpW5fI_DQwOSUTUN6QL
 WVLuvnnLbpDwy40FJoFFpb1YLs83i4V.l_xDCbJ3nlE25Cw.k4IpN7TC5uFm96ctc8Jw4rBklLRB
 XuxtkK7qOj2QX37xC0nusAiH9MQh69G5sU3fSlRbeu5GLiSHxhhWPHkUcWQBPvHmPxU21RwKGi6R
 3LQdbnQOeSVwmL7cG0vr5OdW9tRVBSswGst2AxfGwCwXUnnuBePYBtSC90eyrsaCmgQHj2YCbxpP
 lDioEEqfdOI4GhniZE2V_BoiQbFnwJ3AavJ8h.o8qRRBH7jxPK7i1BrM9SsBrc6HWZGkBV4aLqZs
 Wa7BQE8ZYwugUlgyX95xUNSuGKtL__lAGXP7Okv6iXCqz9XKQt5up23jt1PwqQ2KMvGS9GMCwC1Z
 0DSKzIZGeDE8HRB0egVGWuAV8ANQC7gChZ7g4gFcv2BxAVHzLtZMINzipDruMR7gL.bxly_pqezv
 SYgzIBUhVuefH5GAskcLgpn0ibPLFYlL6jVtlIgIjM1WvAs44j.8SawW5pq.aBFkYfhyq8JeXMsu
 ryMhqexLS_7s5QboVJta7DwQDv9rvrapq8G0CF0COvZiRaJjUh6fAJcUp8TIKtvRgDP6gS_cRQuI
 xMVG3PHGKAUwioU3.dmhA.6BhLwOUlOYEjq5PkxLKdDRk_daDUIh2qN5JuzryExLXgugtLyA9z5V
 YuXwzlQh4RdnxUNONdETyy3u15O.k_pQGUNkESjU67AzIvLsTJbl0cGw17wJBMsWrkxdQMDTQyth
 OlnlVffmriFDchu4sFXaCFH1ce4HrLYKrfaVXGtQ7bkSjO1.I2M_XeHEByLXQ0twG3FwaVHOahkE
 dwCHL3fobI_nx0caK9wyppITVB0v7KV1abvo9ovoKz.GEN7BySipBGordtZkNio29q.7umnz9dfR
 HYOQOoFDaJu27Ltu82lHXpQ--
Received: from sonicgw.mail.yahoo.co.jp by sonicconh5002.mail.kks.yahoo.co.jp
 with HTTP; Wed, 1 Feb 2023 06:03:43 +0000
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp; 
 h=Date:From:Reply-To:Cc:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:References;
 b=RtVFSRdWaxNeLhzq7q5y8pGRg5z2wegpx8QePdFNUaoJ9/Js5tHTk24wpislH3h3
 bpPVp5Ye2fG4YNn72Mmx3T7KpVUN2Yn1rq4A49VRrKTfHIutfAbSYtwH8cPRZICiYBR
 5rxzk2io9kmB6i8ocZfpKRwVDHAZqvyTfG0BoEQ8=
Date: Wed, 1 Feb 2023 15:00:37 +0900 (JST)
From: =?UTF-8?B?5biD5pa9IOWNmuaYjg==?= <hfuse@yahoo.co.jp>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Message-ID: <1446618833.679148.1675231237246.JavaMail.yahoo@mail.yahoo.co.jp>
Subject: Re: Re: audit library license
MIME-Version: 1.0
References: <1446618833.679148.1675231237246.JavaMail.yahoo.ref@mail.yahoo.co.jp>
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
Reply-To: =?UTF-8?B?5biD5pa9IOWNmuaYjg==?= <hfuse@yahoo.co.jp>
Cc: "hiroaki.fuse@ymail.ne.jp" <hiroaki.fuse@ymail.ne.jp>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8sCgpUaGFuayB5b3UgZm9yIHRoZSBjb21tZW50LgpJIGFsc28gZmluZCBmb2xsb3dpbmcg
Y29tbWl0LgogIC0gaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LWF1ZGl0L2F1ZGl0LXVzZXJzcGFj
ZS9jb21taXQvZTYzYThiMTYyODE3MDE1MTAxNjQ3MDA3NTM5NmUzNjk3ZGQ1N2E5YgoKQlRXLCBJ
IGZvdW5kIGFub3RoZXIgbGljZW5zZSBxdWVzdGlvbi4KClRoZSBsaWJhdXBhcnNlLnNvIGFyZSBj
cmVhdGVkIGZvbGxvd2luZyBzb3VyY2UgY29kZXMuCgpJbiAnYXVwYXJzZS9NYWtlZmlsZS5hbScK
CkFNX0NQUEZMQUdTID0gLUkuIC1JJHt0b3Bfc3JjZGlyfSAtSSR7dG9wX3NyY2Rpcn0vc3JjIC1J
JHt0b3Bfc3JjZGlyfS9saWIgLUkke3RvcF9zcmNkaXJ9L2NvbW1vbgogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOgps
aWJhdXBhcnNlX2xhX1NPVVJDRVMgPSBscnUuYyBpbnRlcnByZXQuYyBudmxpc3QuYyBlbGxpc3Qu
YwkJXAoJYXVwYXJzZS5jIGF1ZGl0ZC1jb25maWcuYyBtZXNzYWdlLmMgZGF0YV9idWYuYyAJCQlc
CglhdXBhcnNlLWRlZnMuaAlhdXBhcnNlLWlkYXRhLmggZGF0YV9idWYuaCAJCQlcCgludmxpc3Qu
aCBhdXBhcnNlLmggZWxsaXN0LmgJCQkJCVwKCWludGVybmFsLmggbHJ1Lmggcm5vZGUuaCBpbnRl
cnByZXQuaAkJCQlcCglwcml2YXRlLmggZXhwcmVzc2lvbi5jIGV4cHJlc3Npb24uaCB0dHlfbmFt
ZWRfa2V5cy5oCQlcCglub3JtYWxpemUuYyBub3JtYWxpemUtbGxpc3QuYyBub3JtYWxpemUtbGxp
c3QuaCAJCVwKCW5vcm1hbGl6ZS1pbnRlcm5hbC5oIG5vcm1hbGl6ZV9vYmpfa2luZF9tYXAuaAkJ
CVwKCW5vcm1hbGl6ZV9yZWNvcmRfbWFwLmggbm9ybWFsaXplX3N5c2NhbGxfbWFwLmgKCldlIGNh
biBmaW5kIGZvbGxvd2luZyBsaW5lIGluIGludGVybmFsLmgKCiNpbmNsdWRlICJhdWRpdGQtY29u
ZmlnLmgiCgpJIGNhbiBmaW5kIHNyYy9hdWRpdGQtY29uZmlnLmggZmlsZSB3aGljaCBpcyBHUEx2
Mi4KClRoZSAic3JjL2F1ZGl0ZC1jb25maWcuaCIgc2hvdWxkIGJlIGFsc28gTEdQTHYyLjEKClJl
Z2FyZHNzLAoKPiAtLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gCj4gRnJvbTogIlN0ZXZl
IEdydWJiIiA8c2dydWJiQHJlZGhhdC5jb20+Cj4gVG86ICJsaW51eC1hdWRpdEByZWRoYXQuY29t
IiA8bGludXgtYXVkaXRAcmVkaGF0LmNvbT4KPiBDYzogImhpcm9ha2kuZnVzZUB5bWFpbC5uZS5q
cCIgPGhpcm9ha2kuZnVzZUB5bWFpbC5uZS5qcD4KPiBEYXRlOiAyMDIzLzAyLzAxIOawtCAwMDo1
Mwo+IFN1YmplY3Q6IFJlOiBhdWRpdCBsaWJyYXJ5IGxpY2Vuc2UKPiAKPiAKPiBIZWxsbywKPiAK
PiBPbiBNb25kYXksIEphbnVhcnkgMzAsIDIwMjMgNzo1NToyMCBQTSBFU1QgaGlyb2FraS5mdXNl
QHltYWlsLm5lLmpwIHdyb3RlOgo+ID4gRGVhciBBbGwgbWVtYmVycywKPiA+IAo+ID4gV2UgY2Fu
IGZpbmQgZm9sbG93aW5nIGxpbmVzIGluIGF1ZGl0L1JFQURNRSBmaWxlCj4gPiAKPiA+IExJQ0VO
U0UKPiA+ID09PT09PT0KPiA+IFRoZSBhdWRpdCBkYWVtb24gaXMgcmVsZWFzZWQgYXMgR1BMJ2Qg
Y29kZS4gVGhlIGF1ZGl0IGRhZW1vbidzIGxpYnJhcmllcwo+ID4gbGliYXVkaXQuKiBhbmQgbGli
YXVwYXJzZS4qIGFyZSByZWxlYXNlZCB1bmRlciBMR1BMIHNvIHRoYXQgaXQgbWF5IGJlCj4gPiBs
aW5rZWQgd2l0aCAzcmQgcGFydHkgc29mdHdhcmUuCj4gPiAKPiA+IEkgZm91bmQgdGhhdCBsYXRl
c3QgYXVkaXQgbGlicmFyeSBsaW5rZWQgbGliYXVjb21tb24uc28uCj4gPiAKPiA+IC4vbGliL01h
a2VmaWxlLmluOkFNX0NQUEZMQUdTID0gLUkuIC1JJHt0b3Bfc3JjZGlyfSAtSSR7dG9wX3NyY2Rp
cn0vYXVwYXJzZQo+ID4gLUkke3RvcF9zcmNkaXJ9L2NvbW1vbiAuL2xpYi9NYWtlZmlsZS5pbjps
aWJhdWRpdF9sYV9MSUJBREQgPQo+ID4gJChDQVBOR19MREFERCkgJHt0b3BfYnVpbGRkaXJ9L2Nv
bW1vbi9saWJhdWNvbW1vbi5sYQo+ID4gLi9saWIvTWFrZWZpbGUuaW46bGliYXVkaXRfbGFfREVQ
RU5ERU5DSUVTID0gJChsaWJhdWRpdF9sYV9TT1VSQ0VTKQo+ID4gLi4vY29uZmlnLmggJHt0b3Bf
YnVpbGRkaXJ9L2NvbW1vbi9saWJhdWNvbW1vbi5sYQo+ID4gCj4gPiAuL2F1cGFyc2UvTWFrZWZp
bGUuYW06QU1fQ1BQRkxBR1MgPSAtSS4gLUkke3RvcF9zcmNkaXJ9IC1JJHt0b3Bfc3JjZGlyfS9z
cmMKPiA+IC1JJHt0b3Bfc3JjZGlyfS9saWIgLUkke3RvcF9zcmNkaXJ9L2NvbW1vbgo+ID4gLi9h
dXBhcnNlL01ha2VmaWxlLmFtOmxpYmF1cGFyc2VfbGFfTElCQUREID0KPiA+ICR7dG9wX2J1aWxk
ZGlyfS9saWIvbGliYXVkaXQubGEgJHt0b3BfYnVpbGRkaXJ9L2NvbW1vbi9saWJhdWNvbW1vbi5s
YQo+ID4gLi9hdXBhcnNlL01ha2VmaWxlLmFtOmxpYmF1cGFyc2VfbGFfREVQRU5ERU5DSUVTID0K
PiA+ICQobGliYXVwYXJzZV9sYV9TT1VSQ0VTKSAke3RvcF9idWlsZGRpcn0vY29uZmlnLmgKPiA+
ICR7dG9wX2J1aWxkZGlyfS9jb21tb24vbGliYXVjb21tb24ubGEKPiA+IAo+ID4gTGliYXVjb21t
by5zbyBpcyBjcmVhdGVkIGJ5IGZvbGxvd2luZyBmaWxlcwo+ID4gCj4gPiAuL2NvbW1vbi9NYWtl
ZmlsZS5hbTpsaWJhdWNvbW1vbl9sYV9TT1VSQ0VTID0gYXVkaXQtZmdldHMuYyBzdHJzcGxpdC5j
Cj4gPiAKPiA+IEFuZCB0aGUgbGljZW5zZSBvZiBhdWRpdC9jb21tb24vYXVkaXQtZmdldHMuYyBp
cyBHUEx2Mgo+ID4gCj4gPiBUaGlzIG1lYW4gdGhlIGxpY2Vuc2Ugb2YgbGF0ZXN0IGF1ZGl0IGxp
YnJhcmllcyBhcmUgYWxzbyBHUEx2Mi4KPiA+IAo+ID4gSXMgbXkgdW5kZXJzdGFuZGluZyBjb3Jy
ZWN0Pwo+IAo+IFRoZSBpbnRlbnRpb24gc3RhdGVkIGluIHRoZSBSRUFETUUgZmlsZSBpcyBjb3Jy
ZWN0LiBUaGUgY29kZSBpbiBxdWVzdGlvbiBpcyAKPiBvbmx5IHVzZWQgYnkgMyBwbHVnaW5zIHdo
aWNoIGFyZSBHUEwgYW5kIHRob3NlIGZ1bmN0aW9ucyBhcmUgaGlkZGVuIGZyb20gCj4gZXh0ZXJu
YWwgdXNlcnMgb2YgbGliYXVkaXQuIFRoZSBjb2RlIGNhbiBiZSByZWxpY2VuY2VkIHRvIG1ha2Ug
aXQgTEdQTCBzbyAKPiBldmVyeXRoaW5nIG1hdGNoZXMgdGhlIGludGVudGlvbnMuCj4gCj4gLVN0
ZXZlCj4gCj4gCj4gLS0KPiBMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKPiBMaW51eC1hdWRpdEBy
ZWRoYXQuY29tCj4gaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hdWRpdAo+IAo+IAoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0
QHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hdWRpdAo=

