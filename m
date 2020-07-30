Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D412B233891
	for <lists+linux-audit@lfdr.de>; Thu, 30 Jul 2020 20:50:31 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-UAwRhBNQNxGk35UwsK8kWw-1; Thu, 30 Jul 2020 14:50:28 -0400
X-MC-Unique: UAwRhBNQNxGk35UwsK8kWw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3BC879EDF;
	Thu, 30 Jul 2020 18:50:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF2776111F;
	Thu, 30 Jul 2020 18:50:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 118CA1809557;
	Thu, 30 Jul 2020 18:50:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06UIlFa2025487 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 30 Jul 2020 14:47:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6B1BC2156708; Thu, 30 Jul 2020 18:47:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 673462156A30
	for <linux-audit@redhat.com>; Thu, 30 Jul 2020 18:47:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28D758007D1
	for <linux-audit@redhat.com>; Thu, 30 Jul 2020 18:47:11 +0000 (UTC)
Received: from mr85p00im-hyfv06021401.me.com (mr85p00im-hyfv06021401.me.com
	[17.58.23.190]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-438-T_oBdMKcMryIYYvKHnvLiA-1; Thu, 30 Jul 2020 14:47:07 -0400
X-MC-Unique: T_oBdMKcMryIYYvKHnvLiA-1
Received: from [192.168.7.96] (162-196-90-251.lightspeed.frokca.sbcglobal.net
	[162.196.90.251])
	by mr85p00im-hyfv06021401.me.com (Postfix) with ESMTPSA id 4E5CE9C05C3; 
	Thu, 30 Jul 2020 18:47:06 +0000 (UTC)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: httpd auid = -1
From: Todd Heberlein <todd_heberlein@mac.com>
In-Reply-To: <1740602.XSbsyeiCUq@x2>
Date: Thu, 30 Jul 2020 11:47:05 -0700
Message-Id: <87773DC0-7C77-470D-8E13-ED8C217D4C0E@mac.com>
References: <68DC7FD9-D7FA-4D7D-BE40-0636059BD9D2@mac.com>
	<1740602.XSbsyeiCUq@x2>
To: Steve Grubb <sgrubb@redhat.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
	definitions=2020-07-30_14:2020-07-30,
	2020-07-30 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-2004280000 definitions=main-2007300131
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06UIlFa2025487
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzIQoKVGhpcyBoYXMgc29tZSBpbnRlcmVzdGluZyBpbXBsaWNhdGlvbnMgcmVnYXJkaW5n
IGF0dGFja2VycyBjb21pbmcgaW4gdGhyb3VnaCBhIHZ1bG5lcmFiaWxpdHkgaW4gYW4gb3JnYW5p
emF0aW9uJ3Mgd2ViIHNlcnZpY2VzLiBJ4oCZbGwgaGF2ZSB0byBjb21wYXJlIHdoYXQgcmVsZXZh
bnQgaW5mb3JtYXRpb24gSSBjYW4gY2FwdHVyZSBpbiB0aGUgYXVkaXQgbG9ncyB2cy4gd2hhdCBp
cyBjYXB0dXJlZCBpbiB3ZWIgc2VydmVyIGxvZ3MuCgpUb2RkCgoKPiBPbiBKdWwgMzAsIDIwMjAs
IGF0IDExOjI5IEFNLCBTdGV2ZSBHcnViYiA8c2dydWJiQHJlZGhhdC5jb20+IHdyb3RlOgo+IAo+
IE9uIFRodXJzZGF5LCBKdWx5IDMwLCAyMDIwIDE6NTQ6MDkgUE0gRURUIFRvZGQgSGViZXJsZWlu
IHdyb3RlOgo+PiBJ4oCZdmUgbm90aWNlZCB0aGF0IHRoZSBodHRwZCBwcm9jZXNzIG9uIGEgQ2Vu
dE9TIDcuNyBzeXN0ZW0gSSBhbSB3b3JraW5nCj4+IHdpdGggaXMgcnVubmluZyB3aXRoIGFuIEF1
ZGl0IElEIG9mIC0xLiBFeGFtcGxlIElEIHZhbHVlcyBhcmU6Cj4+IAo+PiAgICAgICAgYXVpZD00
Mjk0OTY3Mjk1Cj4+ICAgICAgICB1aWQ9NDgKPj4gICAgICAgIGdpZD00OAo+PiAgICAgICAgLi4u
Cj4+IAo+PiBTbyBpZiB1c2UgdGhlIHN0YW5kYXJkIGZpbHRlciAiLUYgYXVpZCE9LTHigJ0gaW4g
dGhlIGF1ZGl0IHJ1bGVzIEkgZG8gbm90IHNlZQo+PiBodHRwZCBhY3Rpdml0eS4KPj4gCj4+IElz
IHRoaXMgY29tbW9uPwo+IAo+IFllcywgdGhpcyBpcyBjb21tb24uIE1vc3QgcGVvcGxlIGFyZSBp
bnRlcmVzdGVkIGluIHRoZSBhY3Rpb25zIHRoYXQgcGVvcGxlCj4gdGFrZSBvbiB0aGUgbWFjaGlu
ZSByYXRoZXIgdGhhbiBub3JtYWwgc3lzdGVtIGZ1bmN0aW9uaW5nLgo+IAo+PiBIb3cgZG8gSSBj
aGFuZ2UgdGhlIGF1aWQgdG8gc29tZXRoaW5nIGVsc2UsIHNvIEkgY2FuIGNhcHR1cmUgdGhlIGh0
dHBkCj4+IGFjdGl2aXR5IGluIHRoZSBhdWRpdCBsb2c/Cj4gCj4gQSBjb3VwbGUgb2Ygd2F5cy4g
Cj4gMSkgcmVtb3ZlIHRoZSBhdWlkIT0tMS4gVGhhdCB3aWxsIGdldCB5b3UgYWxsIGRhZW1vbnMu
Cj4gMikgVXNlIGF1ZGl0IGJ5IGV4ZWN1dGFibGUgcnVsZXM6Cj4gLWEgYWx3YXlzLGV4aXQgLUYg
YXJjaD1iNjQgLVMgZXhlY3ZlIC1GIGV4ZT0vdXNyL3NiaW4vaHR0cGQgLUYga2V5PWh0dHBkLWV4
ZWMKPiAKPiAtU3RldmUgCj4gCj4+IEV4YW1wbGUgYXVkaXQgbGluZToKPj4gCj4+IHR5cGU9U1lT
Q0FMTCBtc2c9YXVkaXQoMTU5NjA2NTU2Ni43MjE6MzEzNTcpOiBhcmNoPWMwMDAwMDNlIHN5c2Nh
bGw9Mgo+PiBzdWNjZXNzPXllcyBleGl0PTE1IGEwPTU1YTBhMmQ5YjNjMCBhMT04MDAwMCBhMj0w
IGEzPTdmZmU1ZDRkNjcyMCBpdGVtcz0xCj4+IHBwaWQ9MTEzMCBwaWQ9MTI1MyBhdWlkPTQyOTQ5
NjcyOTUgdWlkPTQ4IGdpZD00OCBldWlkPTQ4IHN1aWQ9NDggZnN1aWQ9NDgKPj4gZWdpZD00OCBz
Z2lkPTQ4IGZzZ2lkPTQ4IHR0eT0obm9uZSkgc2VzPTQyOTQ5NjcyOTUgY29tbT0iaHR0cGQiCj4+
IGV4ZT0iL3Vzci9zYmluL2h0dHBkIiBrZXk9KG51bGwpCj4gCj4gCj4gCj4gCgoKLS0KTGludXgt
YXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVk
aGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0

