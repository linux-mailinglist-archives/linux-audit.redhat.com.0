Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E0249687FAE
	for <lists+linux-audit@lfdr.de>; Thu,  2 Feb 2023 15:14:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675347252;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gY5q9hMRX1IaqbTIYo/wpCqv2f84XO9q1VL3l92eK2w=;
	b=Nh1pOkziKlKsP+WIuKWxQHKYSSbLJL28+I45IjqLKwSiTjJQ3MNGwQN+0443pyOtC3m0BG
	RJ/aYKGp2nUR3VDbDxnEpe8Qd6x2/N13h050nGGppGFCzhQUb5Q9h0o/KSCFD7Q+zC9S6R
	RuIkOn3nTh4NZ8+7mvnJaWjSlqzR/0w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-32-n90HOgU6Py6vTLnVLd7u9w-1; Thu, 02 Feb 2023 09:14:11 -0500
X-MC-Unique: n90HOgU6Py6vTLnVLd7u9w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCBB6882829;
	Thu,  2 Feb 2023 14:14:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 23D8251FF;
	Thu,  2 Feb 2023 14:14:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A93301946A49;
	Thu,  2 Feb 2023 14:14:01 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DBA25194658F for <linux-audit@listman.corp.redhat.com>;
 Thu,  2 Feb 2023 05:25:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 86FD0404BEC1; Thu,  2 Feb 2023 05:25:54 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F41C404BEC0
 for <linux-audit@redhat.com>; Thu,  2 Feb 2023 05:25:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 638AD100DEA1
 for <linux-audit@redhat.com>; Thu,  2 Feb 2023 05:25:54 +0000 (UTC)
Received: from sonicconh6001-vm1.mail.ssk.yahoo.co.jp
 (sonicconh6001-vm1.mail.ssk.yahoo.co.jp [182.22.37.10]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-pJNZKuVHMHm_m2y7oSXx-Q-1; Thu, 02 Feb 2023 00:25:49 -0500
X-MC-Unique: pJNZKuVHMHm_m2y7oSXx-Q-1
X-YMail-OSG: L4anuJEVM1nIHZzOsZsXUUg0ip7CHEQvovUThV1788SVIkAUwIp9kyTNyXjkEbi
 JA3WHkRyyWkPl.yb47oEMaOAcXsRciOCWadEDYpgbpFoEsCoETgUohAMPZmLHWo8l8NAeRn0OjF2
 q44Nuz83mJBDHDSPf8_VqNByc8z3zOlN5x.UyjwdWRWVVIgH8ViVzYLjdqPrw.Va6Qvor.eG3mIM
 9owyDWAoHSNl1MCjBieB3oGnTyxgWTzLcfVIB2IJwLwvcd1hlbbipTeFgXe5m8fAlXs9ks9hI1yr
 in9Jhre5YHhwkFRVXOBXSx39WJM_9MOO_Bn.wujpKglJPOnMpyTZ0EH1tiO.OQQ124WLRFpFYviT
 3ar7hQlyDrXy0ScY79CyutBal66iw.PDywxg1CHeG3E4SKUPyMcSurjOus48iTRH.FoqduC6X9a1
 ng6BC_Z3VE0sU9ZHJhj5brQT7Owfr5cluL4p7JHiwek9J9Ibdq2NHPhDJgj79xQO_UDl2h8fkcVE
 _eJjWiVMN6fmEk4Gr3e7TTUejhpKyyKGNuGf8N0Ij0DQZJ0CPUM9J1P13a1S9ehB25DUOCq_YtYX
 oWzP0FxWl.2Vq3Cp5w5SsEymWyZAV5W6.WVRhsAQVFtVTxstwueflRoSSCdg433uTKhClbOLr556
 9h8L4ncwX1ssLIEt3jPdd5JF2Flen9dp0KuibRvQpSZjb1R6YSNUGZlJLku_OvcJJ1gs8QHEEwg9
 JbU.UdXDFc.FNzeRrvySWxplPketb3S1y3uaGfJTOyFqKcf27Ysqo2OA799o94jiHr4U9u3m.Xr.
 u_DnSNfVezHkoV9xQNYFVLqQhTV2uqA7K38QqVXM237cViFWcvig5ijtxk57LVfHFe7PCfhm0pNc
 MK7jjmnq2BxRqxiAA7IWy1Fp1WVvuZspeyIrr3ydv8qnIs.Qj6KUMJOreGUV9WIegibMtWfYWfR6
 DOPHBPwve6zg.oTe_cG7BQwPDUvCq1y2AuZy_QzPiVQuLo7duvozGX4uUglnAf8i9FMzQ.lqGfEe
 OFE9RcD57AzFcceKBdadHdbg-
Received: from sonicgw.mail.yahoo.co.jp by sonicconh6001.mail.ssk.yahoo.co.jp
 with HTTP; Thu, 2 Feb 2023 05:25:47 +0000
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=ymail20211126; d=ymail.ne.jp;
 h=Date:From:Reply-To:Cc:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=R7hOKSnto93IXgmrLFfWqmJ8DNz4rIU9MsUXSUwhj3xPtzMsmyEcUaaadqqKC770
 TXc4FMAhk8KqHyuDzDAUBdPAuNaSswj7srxJyICpAiRWHQjFMGUcO/tO1qosAdqSm1O
 0bRuq/GIAfQH5RWUUh9nSywkwzUgnUrA7pCks3Tc=
Date: Thu, 2 Feb 2023 14:25:46 +0900 (JST)
From: hiroaki.fuse@ymail.ne.jp
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Message-ID: <627860620.734090.1675315546605.JavaMail.yahoo@mail.yahoo.co.jp>
In-Reply-To: <2683616.mvXUDI8C0e@x2>
References: <1446618833.679148.1675231237246.JavaMail.yahoo.ref@mail.yahoo.co.jp>
 <1446618833.679148.1675231237246.JavaMail.yahoo@mail.yahoo.co.jp>
 <2683616.mvXUDI8C0e@x2>
Subject: Re: Re: audit library license
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Thu, 02 Feb 2023 14:14:00 +0000
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
Reply-To: hiroaki.fuse@ymail.ne.jp
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8sCgpUaGFuayB5b3UgZm9yIHRoZSBxdWljayByZXBseS4KTm93IHRoZSBsaWNlbnNlIG9m
IGF1ZGl0IGxpYnJhcmllcyBhcmUgY2xlYXIhIQoKUmVnYXJkcywKCj4gLS0tLS0gT3JpZ2luYWwg
TWVzc2FnZSAtLS0tLQo+IAo+IEZyb206ICJTdGV2ZSBHcnViYiIgPHNncnViYkByZWRoYXQuY29t
Pgo+IFRvOiAibGludXgtYXVkaXRAcmVkaGF0LmNvbSIgPGxpbnV4LWF1ZGl0QHJlZGhhdC5jb20+
Cj4gQ2M6ICJoaXJvYWtpLmZ1c2VAeW1haWwubmUuanAiIDxoaXJvYWtpLmZ1c2VAeW1haWwubmUu
anA+OyAi5biD5pa9IOWNmuaYjiIgPGhmdXNlQHlhaG9vLmNvLmpwPgo+IERhdGU6IDIwMjMvMDIv
MDIg5pyoIDA3OjA5Cj4gU3ViamVjdDogUmU6IGF1ZGl0IGxpYnJhcnkgbGljZW5zZQo+IAo+IAo+
IEhlbGxvLAo+IAo+IE9uIFdlZG5lc2RheSwgRmVicnVhcnkgMSwgMjAyMyAxOjAwOjM3IEFNIEVT
VCDluIPmlr0g5Y2a5piOIHdyb3RlOgo+ID4gVGhhbmsgeW91IGZvciB0aGUgY29tbWVudC4KPiA+
IEkgYWxzbyBmaW5kIGZvbGxvd2luZyBjb21taXQuCj4gPiAgIC0KPiA+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9saW51eC1hdWRpdC9hdWRpdC11c2Vyc3BhY2UvY29tbWl0L2U2M2E4YjE2MjgxNzAxNTEw
MTY0Cj4gPiA3MDA3NTM5NmUzNjk3ZGQ1N2E5Ygo+ID4gCj4gPiBCVFcsIEkgZm91bmQgYW5vdGhl
ciBsaWNlbnNlIHF1ZXN0aW9uLgo+ID4gCj4gPiBUaGUgbGliYXVwYXJzZS5zbyBhcmUgY3JlYXRl
ZCBmb2xsb3dpbmcgc291cmNlIGNvZGVzLgo+ID4gCj4gPiBJbiAnYXVwYXJzZS9NYWtlZmlsZS5h
bScKPiA+IAo+ID4gQU1fQ1BQRkxBR1MgPSAtSS4gLUkke3RvcF9zcmNkaXJ9IC1JJHt0b3Bfc3Jj
ZGlyfS9zcmMgLUkke3RvcF9zcmNkaXJ9L2xpYgo+ID4gLUkke3RvcF9zcmNkaXJ9L2NvbW1vbgo+
ID4gCj4gPiBsaWJhdXBhcnNlX2xhX1NPVVJDRVMgPSBscnUuYyBpbnRlcnByZXQuYyBudmxpc3Qu
YyBlbGxpc3QuYwkJXAo+ID4gCWF1cGFyc2UuYyBhdWRpdGQtY29uZmlnLmMgbWVzc2FnZS5jIGRh
dGFfYnVmLmMgCQkJXAo+ID4gCWF1cGFyc2UtZGVmcy5oCWF1cGFyc2UtaWRhdGEuaCBkYXRhX2J1
Zi5oIAkJCVwKPiA+IAludmxpc3QuaCBhdXBhcnNlLmggZWxsaXN0LmgJCQkJCVwKPiA+IAlpbnRl
cm5hbC5oIGxydS5oIHJub2RlLmggaW50ZXJwcmV0LmgJCQkJXAo+ID4gCXByaXZhdGUuaCBleHBy
ZXNzaW9uLmMgZXhwcmVzc2lvbi5oIHR0eV9uYW1lZF9rZXlzLmgJCVwKPiA+IAlub3JtYWxpemUu
YyBub3JtYWxpemUtbGxpc3QuYyBub3JtYWxpemUtbGxpc3QuaCAJCVwKPiA+IAlub3JtYWxpemUt
aW50ZXJuYWwuaCBub3JtYWxpemVfb2JqX2tpbmRfbWFwLmgJCQlcCj4gPiAJbm9ybWFsaXplX3Jl
Y29yZF9tYXAuaCBub3JtYWxpemVfc3lzY2FsbF9tYXAuaAo+ID4gCj4gPiBXZSBjYW4gZmluZCBm
b2xsb3dpbmcgbGluZSBpbiBpbnRlcm5hbC5oCj4gPiAKPiA+ICNpbmNsdWRlICJhdWRpdGQtY29u
ZmlnLmgiCj4gPiAKPiA+IEkgY2FuIGZpbmQgc3JjL2F1ZGl0ZC1jb25maWcuaCBmaWxlIHdoaWNo
IGlzIEdQTHYyLgo+ID4gCj4gPiBUaGUgInNyYy9hdWRpdGQtY29uZmlnLmgiIHNob3VsZCBiZSBh
bHNvIExHUEx2Mi4xCj4gCj4gVGhhdCBmaWxlIGlzIGFsc28gbWlzbGFiZWxlZC4gSXQgaXMgbm93
IGNvcnJlY3RlZC4gVGhhbmtzIGZvciB0aGUgcmV2aWV3Lgo+IAo+IC1TdGV2ZQo+IAo+IAoKLS0K
TGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly9s
aXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRpdAo=

